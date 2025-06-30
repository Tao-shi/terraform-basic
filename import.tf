# import {
#   id = "subnet-0438e34d75bba71db"
#   to = aws_subnet.tao_pub_subnet_ipv6
# }

# import {
#   id = "tao-test-222"
#   to = aws_s3_bucket.buck
# }

# resource "aws_s3_bucket" "buck" {
# }
# resource "aws_subnet" "tao_ipv6" {
#   vpc_id = "vpc-0861ff04ba04ae9bd"
#   tags = {
#     "Name" = "tao-test-pub-subnet-1"
#     "IP-Version" = "ipv6"
#   }
#   lifecycle {
#     prevent_destroy = false
#   }
# }

# resource "aws_subnet" "tao_pub_subnet_ipv6" {
#   vpc_id          = data.aws_vpc.tao_vpc.id
#   ipv6_cidr_block = "2600:1f18:905:d900::/56"
#   tags = {
#     "Name" = "tao-vpc"
#   }
#   cidr_block                      = "10.23.0.0/28"
#   map_public_ip_on_launch         = true
#   assign_ipv6_address_on_creation = true

# }

# 1. create import resource and add important attributes
# 2. import the resource
# 3. run tf plan to check state
# 4. remove the older resource to be replaced (tf state rm "resource")
# 5. cause two resources cannot have the same names, the occurrences of the older resource has to be replaced with the imported
# 6. run tf plan