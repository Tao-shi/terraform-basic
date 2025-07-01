resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attch_001" {
    appliance_mode_support                          = "disable"
    dns_support                                     = "enable"
    # id                                              = "tgw-attach-0453935aa9675e79b"
    ipv6_support                                    = "disable"
    security_group_referencing_support              = "enable"
    subnet_ids                                      = [
        "subnet-0174f043db86ec93d",
    ]
    tags                                            = {
       "Name" = "tgw-attch-001"
    }
    transit_gateway_default_route_table_association = true
    transit_gateway_default_route_table_propagation = true
    transit_gateway_id                              = "tgw-0f77d962ed25c179a"
    vpc_id                                          = "vpc-0861ff04ba04ae9bd"
    # vpc_owner_id                                    = "339712936044"
}

