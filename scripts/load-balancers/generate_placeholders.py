import json
import subprocess
import os

# Directory to store final .tf files
output_dir = '/home/taofiq.subair@Interswitchng.com/projects-gh/terraform-basic'

import_filename = 'security_group_imported.tf'
minimal_filename = "sg_minimal.tf"
import_count = 0

# Create output dir if it does not exist
os.makedirs(output_dir, exist_ok=True)

# Read subnets from JSON file
with open("/home/taofiq.subair@Interswitchng.com/projects-gh/terraform-basic/scripts/security-groups/security_groups.json") as f:
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
    cleaned_lines = []
    skip_block = False
    skip_keys = {
    "arn",
    "id",
    "owner_id",
    "revoke_rules_on_delete",
    "tags_all",
    "name",
    "name_prefix"
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
            brace_depth += line.count("{")
            brace_depth -= line.count("}")

            # Handle skip block mode
            if skip_block:
                if "}" in stripped:
                    skip_block = False
                continue            

            # Attempt to extract the key before '='
            if " = " in stripped and brace_depth >= 1:
                key = stripped.split(" = ")[0].strip()
                if key in skip_keys:
                    if stripped.endswith("{"):
                        skip_block = True                    
                    continue
            cleaned_lines.append(line)

        # If top level resource block is closed        
        if brace_depth == 0:
            break        

    return "\n".join(cleaned_lines)

if os.path.isfile(os.path.join(output_dir, import_filename)):
    os.remove(os.path.join(output_dir, import_filename))

for sg in data["SecurityGroups"]:
    sg_id = sg["GroupId"]
    vpc_id = sg["VpcId"]
    name = sg["GroupName"]
    if name == 'default':
        name = get_tag(sg.get("Tags", []), 'Name') or sg_id
    tf_name = name.replace("-", "_").replace(" ", "_").lower()
    tf_block = f'''
resource "aws_security_group" "{tf_name}" {{
  vpc_id     = "{vpc_id}"
}}
'''
    
    with open(os.path.join(output_dir, minimal_filename), "w") as f:
        f.write(tf_block)
    # Run the terraform import
    import_result = subprocess.run(["terraform", f"-chdir={output_dir}", "import", f"aws_security_group.{tf_name}", sg_id, "-no-color"], capture_output=True, text=True)
    if import_result.stderr == '':
       print(f"Import of aws_security_group.{tf_name} {sg_id} successful!")
       import_count += 1
    else:
       print(f"Import of aws_security_group.{tf_name} {sg_id} failed!")
       print(import_result.stderr)
    
    print("---------------------------------------------------------------------------------------------------")

    # Unimport resources (optional)
    # subprocess.run(["terraform", f"-chdir={output_dir}", "state", "rm", f"aws_security_group.{tf_name}"])

    # Use state show command to build resource block
    if import_result.returncode != 1 :
        build_result = subprocess.run(["terraform", f"-chdir={output_dir}", "state", "show", f"aws_security_group.{tf_name}", "-no-color"], capture_output=True, text=True)
        if build_result.returncode == 0:
            cleaned_output = clean_state_show_output(build_result.stdout, tf_name)
            with open(os.path.join(output_dir, import_filename), "a") as tf_file:
                tf_file.write(cleaned_output + "\n\n" ) 
        else:
            print(f"Error building resource block for aws_security_group.{tf_name} {sg_id}!")

print(f"Successfully imported {import_count} security groups.")


# Delete tf file that contains minimal resource blocks            
os.remove(os.path.join(output_dir, minimal_filename))