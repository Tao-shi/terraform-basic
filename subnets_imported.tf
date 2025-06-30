resource "aws_subnet" "tao_vpc" {
    assign_ipv6_address_on_creation                = true
    availability_zone                              = "us-east-1a"
    cidr_block                                     = "10.23.0.0/28"
    enable_dns64                                   = false
    ipv6_cidr_block                                = "2600:1f18:905:d900::/56"
    map_public_ip_on_launch                        = true
    tags                                           = {
        "Name" = "tao-vpc"
    }
    vpc_id                                         = "vpc-0861ff04ba04ae9bd"
}

resource "aws_subnet" "default_subnet_for_us_west_1b" {
    assign_ipv6_address_on_creation                = false
    availability_zone                              = "us-east-1b"
    cidr_block                                     = "172.31.16.0/20"
    enable_dns64                                   = false
    ipv6_cidr_block                                = null
    map_public_ip_on_launch                        = true
    tags                                           = {
        "Name" = "Default subnet for us-west-1b"
    }
    vpc_id                                         = "vpc-0fca234102d21948e"
}

resource "aws_subnet" "default_subnet_for_us_west_1a" {
    assign_ipv6_address_on_creation                = false
    availability_zone                              = "us-east-1a"
    cidr_block                                     = "172.31.80.0/20"
    enable_dns64                                   = false
    ipv6_cidr_block                                = null
    map_public_ip_on_launch                        = true
    tags                                           = {
        "Name" = "Default subnet for us-west-1a"
    }
    vpc_id                                         = "vpc-0fca234102d21948e"
}

resource "aws_subnet" "subnet_0ae4bc4baa1fd4f6b" {
    assign_ipv6_address_on_creation                = false
    availability_zone                              = "us-east-1c"
    cidr_block                                     = "172.31.32.0/20"
    enable_dns64                                   = false
    ipv6_cidr_block                                = null
    map_public_ip_on_launch                        = true
    tags                                           = {
        "Key" = "Test"
    }
    vpc_id                                         = "vpc-0fca234102d21948e"
}

resource "aws_subnet" "subnet_03e8044a610fa3a01" {
    assign_ipv6_address_on_creation                = false
    availability_zone                              = "us-east-1e"
    cidr_block                                     = "172.31.48.0/20"
    enable_dns64                                   = false
    ipv6_cidr_block                                = null
    map_public_ip_on_launch                        = true
    tags                                           = {
        "Key" = "Test"
    }
    vpc_id                                         = "vpc-0fca234102d21948e"
}

resource "aws_subnet" "subnet_0333a74cfe3de7e09" {
    assign_ipv6_address_on_creation                = false
    availability_zone                              = "us-east-1d"
    cidr_block                                     = "172.31.0.0/20"
    enable_dns64                                   = false
    ipv6_cidr_block                                = null
    map_public_ip_on_launch                        = true
    tags                                           = {
        "Key" = "Test"
    }
    vpc_id                                         = "vpc-0fca234102d21948e"
}

resource "aws_subnet" "subnet_0b758a523da70ff65" {
    assign_ipv6_address_on_creation                = false
    availability_zone                              = "us-east-1f"
    cidr_block                                     = "172.31.64.0/20"
    enable_dns64                                   = false
    ipv6_cidr_block                                = null
    map_public_ip_on_launch                        = true
    tags                                           = {
        "Key" = "Test"
    }
    vpc_id                                         = "vpc-0fca234102d21948e"
}

