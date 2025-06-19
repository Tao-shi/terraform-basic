# variable "aws_default_vpc" {
#   type = string
# }

# variable "aws_default_vpc_cidr" {

#   type = string
# }

variable "tao_vpc" {
  type = string
  default = "vpc-0861ff04ba04ae9bd"
}

variable "tao_vpc_cidr" {
  type = string
  default = "10.23.0.0/28"
}