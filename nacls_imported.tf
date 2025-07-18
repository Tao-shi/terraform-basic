resource "aws_default_network_acl" "my_acl_001" {
    default_network_acl_id = "acl-07b16b9b4dc37394c"
    subnet_ids             = [
        "subnet-0174f043db86ec93d",
    ]
    tags                   = {
        "Name" = "my-acl-001"
    }
}

resource "aws_default_network_acl" "acl_08c7449dabaffa3b4" {
    default_network_acl_id = "acl-08c7449dabaffa3b4"
    subnet_ids             = []
    tags                   = {}

    egress {
        action          = "allow"
        cidr_block      = null
        from_port       = 0
        icmp_code       = 0
        icmp_type       = 0
        ipv6_cidr_block = "::/0"
        protocol        = "-1"
        rule_no         = 101
        to_port         = 0
    }
    egress {
        action          = "allow"
        cidr_block      = "0.0.0.0/0"
        from_port       = 0
        icmp_code       = 0
        icmp_type       = 0
        ipv6_cidr_block = null
        protocol        = "-1"
        rule_no         = 100
        to_port         = 0
    }

    ingress {
        action          = "allow"
        cidr_block      = null
        from_port       = 0
        icmp_code       = 0
        icmp_type       = 0
        ipv6_cidr_block = "::/0"
        protocol        = "-1"
        rule_no         = 101
        to_port         = 0
    }
    ingress {
        action          = "allow"
        cidr_block      = "0.0.0.0/0"
        from_port       = 0
        icmp_code       = 0
        icmp_type       = 0
        ipv6_cidr_block = null
        protocol        = "-1"
        rule_no         = 100
        to_port         = 0
    }
}

resource "aws_default_network_acl" "acl_0d2b29f9433b15ffb" {
    default_network_acl_id = "acl-0d2b29f9433b15ffb"
    subnet_ids             = [
        "subnet-0333a74cfe3de7e09",
        "subnet-03e8044a610fa3a01",
        "subnet-068bff19f01604eae",
        "subnet-0ae4bc4baa1fd4f6b",
        "subnet-0b758a523da70ff65",
        "subnet-0ec729c87fee32f90",
    ]
    tags                   = {
        "Key" = "Test"
    }

    egress {
        action          = "allow"
        cidr_block      = "0.0.0.0/0"
        from_port       = 0
        icmp_code       = 0
        icmp_type       = 0
        ipv6_cidr_block = null
        protocol        = "-1"
        rule_no         = 100
        to_port         = 0
    }

    ingress {
        action          = "allow"
        cidr_block      = "0.0.0.0/0"
        from_port       = 0
        icmp_code       = 0
        icmp_type       = 0
        ipv6_cidr_block = null
        protocol        = "-1"
        rule_no         = 100
        to_port         = 0
    }
}

