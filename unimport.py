import subprocess

l = [
"aws_subnet.subnet_0ae4bc4baa1fd4f6b",
"aws_subnet.tao_vpc",
"aws_subnet.default_subnet_for_us_west_1a",
"aws_subnet.subnet_0ae4bc4baa1fd4f6b",
"aws_subnet.subnet_03e8044a610fa3a01",
"aws_subnet.subnet_0333a74cfe3de7e09",
"aws_subnet.subnet_0b758a523da70ff65",
# "xxx"
]

for a in l:
    subprocess.run(["terraform", "state", "rm", f"{a}"])