terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.77.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "tao_vpc" {
  id = "vpc-0861ff04ba04ae9bd"
}

# data "aws_subnet" "tao_subnet_1a" {
#   vpc_id = data.aws_vpc.tao_vpc.id
#   availability_zone = "us-east-1a"
# }

# resource "aws_subnet" "tao_pub_subnet" {
#   vpc_id                          = data.aws_vpc.tao_vpc.id
#   cidr_block                      = "10.23.0.0/28"
#   assign_ipv6_address_on_creation = true
#   map_public_ip_on_launch         = true
#   ipv6_cidr_block                 = "2600:1f18:905:d900::/56"
#   availability_zone               = "us-east-1a"
#   tags = {
#     Name = "tao-vpc"
#   }
# }

# resource "aws_default_subnet" "default_az1b" {
#   availability_zone = "us-east-1b"

#   tags = {
#     Name = "Default subnet for us-west-1a"
#   }
# }

module "security_group" {
  source       = "./modules/security-groups"
  tao_vpc      = data.aws_vpc.tao_vpc.id
  tao_vpc_cidr = data.aws_vpc.tao_vpc.cidr_block

}

# module "web_servers" {
#   source                 = "./modules/web-servers"
#   vpc_security_group_ids = [module.security_group.sg_id]
#   ami                    = var.ami_id
#   instance_name          = var.instance_name
#   instance_type          = var.instance_type
#   priv_key_name          = var.key_name
#   subnet_id              = aws_subnet.tao_pub_subnet.id
#   depends_on             = [aws_subnet.tao_pub_subnet]
# }

# module "lb" {
#   source             = "./modules/lb"
#   security_group_ids = [module.security_group.sg_id]
#   default_subnet     = [aws_default_subnet.default_az1a.id, aws_default_subnet.default_az1b.id]
#   default_vpc_id     = aws_vpc.default.id
#   webserver_id       = module.web_servers.instance_ids
# }

# module "db" {
#   source             = "./modules/db"
#   db_instance_type   = var.db_instance_type
#   db_password        = var.db_password
#   db_username        = var.db_username
#   security_group_ids = [module.security_group.sg_id]
# }

# resource "aws_instance" "web_1" {
# ami           = "ami-02457590d33d576c3"
# instance_type = "t2.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
# }
