import json
import subprocess
import os

# Directory to store final .tf files
output_dir = '/home/taofiq.subair/projects-gh/terraform-basic'

res_type = "transit_gateway"
import_filename = f'{res_type}s_imported.tf'
minimal_filename = f"{res_type}_minimal.tf"
import_count = 0

# Create output dir if it does not exist
os.makedirs(output_dir, exist_ok=True)

# Read subnets from JSON file
with open(f"{output_dir}/scripts/transit-gateways/{res_type}s.json") as f:
    data = json.load(f)

# Get value of Name tag
def get_tag(tags, key):
    for tag in tags or []:
        if tag["Key"] == key:
            return tag["Value"]
    return None

# Format terraform resource name
def format_tf_name(name):
    return name.replace("-", "_").replace(" ", "_").lower()  

# Remove unwanted resource attributes
def clean_state_show_output(output, tf_name):
    in_block = False
    brace_depth = 0
    in_list = 0
    cleaned_lines = []
    skip_block = False
    skip_stack_depth = 0    
    skip_keys = {
    # "arn",
    # "id",
    # "owner_id",
    # "vpc_owner_id",
    # "tags_all",
    }


    for line in output.splitlines():
        stripped = line.strip()

        # Skip comments
        if stripped.startswith("#"):
            continue

        # Start of resource block
        if not in_block and stripped.startswith(f'resource "aws_'):
            in_block = True
            cleaned_lines.append(stripped)
            brace_depth = 1
            continue

        if in_block:
            # Count braces to detect the end of the resource
            # brace_depth -= line.count("}")
            # brace_depth += line.count("{")
            in_list += line.count("[")
            in_list += line.count("]")
            open_braces = line.count("{")
            close_braces = line.count("}")
            brace_depth += open_braces - close_braces

            # Handle skip block mode
            if skip_block:
                # if "}" in stripped or "]" in stripped:
                #     skip_block = False
                # Check if we've exited the block
                if (brace_depth < skip_stack_depth) or ("}" in stripped or "]" in stripped):
                    skip_block = False
                    skip_stack_depth = 0                    
                continue            


            if brace_depth > 1 and stripped.endswith("{") and " " not in stripped:
                block_name = stripped.split("{")[0].strip()
                if block_name in skip_keys:
                    skip_block = True
                    block_to_skip = block_name
                    continue

            # Detect start of block-style attribute
            if stripped.endswith("{"):
                block_name = stripped.split("{")[0].split("=")[0].strip()
                if block_name in skip_keys:
                    skip_block = True
                    skip_stack_depth = brace_depth
                    continue

            # Attempt to extract the key before '='
            if " = " in stripped and (brace_depth >= 1 or in_block >=1):
                key = stripped.split(" = ")[0].strip()
                if key in skip_keys:
                    if (stripped.endswith("{") or stripped.endswith("[")):
                        skip_block = True                    
                    continue
            cleaned_lines.append(line)

        # If top level resource block is closed        
        if brace_depth == 0:
            break        

    return "\n".join(cleaned_lines)

if os.path.isfile(os.path.join(output_dir, import_filename)):
    os.remove(os.path.join(output_dir, import_filename))

# Iterate over all instances
for tgw in data["TransitGateways"]:
    tgw_id = tgw["TransitGatewayId"]
    # Prefer tag "Name" for tf_name, fallback to instance ID
    name = get_tag(tgw_id.get("Tags", []), "Name") or tgw_id
    tf_name = name.replace("-", "_").replace(" ", "_").lower()

    # Create Terraform block
    tf_block = f'''
resource "aws_ec2_transit_gateway" "{tf_name}" {{
  description                  = "tgw"
}}
'''
    
    with open(os.path.join(output_dir, minimal_filename), "w") as f:
        f.write(tf_block)
    # Run the terraform import
    import_result = subprocess.run(["terraform", f"-chdir={output_dir}", "import", f"aws_ec2_transit_gateway.{tf_name}", tgw_id, "-no-color"], capture_output=True, text=True)
    if import_result.stderr == '':
       print(f"Import of aws_ec2_transit_gateway.{tf_name} {tgw_id} successful!")
       import_count += 1
    else:
       print(f"Import of aws_ec2_transit_gateway.{tf_name} {tgw_id} failed!")
       print(import_result.stderr)
    
    print("---------------------------------------------------------------------------------------------------")

    # Unimport resources (optional)
    # subprocess.run(["terraform", f"-chdir={output_dir}", "state", "rm", f"aws_ec2_transit_gateway.{tf_name}"])

    # Use state show command to build resource block
    if import_result.returncode != 1 :
        build_result = subprocess.run(["terraform", f"-chdir={output_dir}", "state", "show", f"aws_ec2_transit_gateway.{tf_name}", "-no-color"], capture_output=True, text=True)
        if build_result.returncode == 0:
            cleaned_output = clean_state_show_output(build_result.stdout, tf_name)
            with open(os.path.join(output_dir, import_filename), "a") as tf_file:
                tf_file.write(cleaned_output + "\n\n" ) 
        else:
            print(f"Error building resource block for aws_ec2_transit_gateway.{tf_name} {tgw_id}!")

print(f"Successfully imported {import_count} {res_type}(s).")

# Delete tf file that contains minimal resource blocks            
os.remove(os.path.join(output_dir, minimal_filename))