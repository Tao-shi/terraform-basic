resource "aws_route_table" "rtb_02dae318de87e278a" {
    propagating_vgws = []
    route            = [
        {
            carrier_gateway_id         = null
            cidr_block                 = "0.0.0.0/0"
            core_network_arn           = null
            destination_prefix_list_id = null
            egress_only_gateway_id     = null
            gateway_id                 = "igw-0a2672cfa1224d5ff"
            ipv6_cidr_block            = null
            local_gateway_id           = null
            nat_gateway_id             = null
            network_interface_id       = null
            transit_gateway_id         = null
            vpc_endpoint_id            = null
            vpc_peering_connection_id  = null
        },
    ]
    tags             = {
        "Key" = "Test"
    }
    vpc_id           = "vpc-0fca234102d21948e"
}

resource "aws_route_table" "my_rt_01" {
    propagating_vgws = []
    route            = []
    tags             = {
        "Env"  = "Testing"
        "Name" = "my-rt-01"
    }
    vpc_id           = "vpc-0861ff04ba04ae9bd"
}

resource "aws_route_table" "rtb_0fbf5f6f4f7b6e780" {
    propagating_vgws = []
    route            = [
        {
            carrier_gateway_id         = null
            cidr_block                 = "0.0.0.0/0"
            core_network_arn           = null
            destination_prefix_list_id = null
            egress_only_gateway_id     = null
            gateway_id                 = "igw-0628fd88fcd1eb8c0"
            ipv6_cidr_block            = null
            local_gateway_id           = null
            nat_gateway_id             = null
            network_interface_id       = null
            transit_gateway_id         = null
            vpc_endpoint_id            = null
            vpc_peering_connection_id  = null
        },
    ]
    tags             = {}
    vpc_id           = "vpc-0861ff04ba04ae9bd"
}

