resource "aws_security_group" "tfer--all-out-ssh-in-sg_sg-061698ee1e25d2fad" {
  description = "All outbound and ssh inbound rule"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "3000"
    protocol    = "tcp"
    self        = "false"
    to_port     = "3000"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "5000"
    protocol    = "tcp"
    self        = "false"
    to_port     = "5000"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "8080"
    protocol    = "tcp"
    self        = "false"
    to_port     = "8080"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "9090"
    protocol    = "tcp"
    self        = "false"
    to_port     = "9090"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "9100"
    protocol    = "tcp"
    self        = "false"
    to_port     = "9100"
  }

  name   = "all-out-ssh-in-sg"
  vpc_id = "vpc-0fca234102d21948e"
}

resource "aws_security_group" "tfer--allow_web_traffic_sg-0b3aee3c1553c23ad" {
  description = "Allow HTTP, HTTPS, and SSH traffic"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  name = "allow_web_traffic"

  tags = {
    Name = "allow_web_traffic"
  }

  tags_all = {
    Name = "allow_web_traffic"
  }

  vpc_id = "vpc-0861ff04ba04ae9bd"
}

resource "aws_security_group" "tfer--default_sg-0a1ca2be00f99fedf" {
  description = "default VPC security group"

  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    from_port        = "0"
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "-1"
    self             = "false"
    to_port          = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  vpc_id = "vpc-0861ff04ba04ae9bd"
}

resource "aws_security_group" "tfer--default_sg-0bde661d3c96ae7d1" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name = "default"

  tags = {
    Key = "Test"
  }

  tags_all = {
    Key = "Test"
  }

  vpc_id = "vpc-0fca234102d21948e"
}

resource "aws_security_group" "tfer--launch-wizard-1_sg-0143f4385f63dfa7a" {
  description = "launch-wizard-1 created 2024-12-18T15:18:02.913Z"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name = "launch-wizard-1"

  tags = {
    Key = "Test"
  }

  tags_all = {
    Key = "Test"
  }

  vpc_id = "vpc-0fca234102d21948e"
}

resource "aws_security_group" "tfer--launch-wizard-2_sg-0fe8c7481df4ad68a" {
  description = "launch-wizard-2 created 2024-12-18T15:20:43.521Z"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name = "launch-wizard-2"

  tags = {
    Key = "Test"
  }

  tags_all = {
    Key = "Test"
  }

  vpc_id = "vpc-0fca234102d21948e"
}

resource "aws_security_group" "tfer--launch-wizard-3_sg-024754d3a5a15e59d" {
  description = "launch-wizard-3 created 2024-12-19T19:14:02.833Z"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name = "launch-wizard-3"

  tags = {
    Key = "Test"
  }

  tags_all = {
    Key = "Test"
  }

  vpc_id = "vpc-0fca234102d21948e"
}

resource "aws_security_group" "tfer--launch-wizard-4_sg-02d5b2a115d9ea277" {
  description = "launch-wizard-4 created 2025-02-04T12:18:41.652Z"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  name   = "launch-wizard-4"
  vpc_id = "vpc-0fca234102d21948e"
}

resource "aws_security_group" "tfer--launch-wizard-5_sg-09ee3ddb6fb514879" {
  description = "launch-wizard-5 created 2025-06-05T11:27:23.663Z"

  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    from_port        = "0"
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "-1"
    self             = "false"
    to_port          = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "-1"
    protocol    = "icmp"
    self        = "false"
    to_port     = "-1"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "-1"
    protocol    = "icmpv6"
    self        = "false"
    to_port     = "-1"
  }

  name   = "launch-wizard-5"
  vpc_id = "vpc-0861ff04ba04ae9bd"
}

resource "aws_security_group" "tfer--launch-wizard-6_sg-091b995f255283626" {
  description = "launch-wizard-6 created 2025-06-05T11:36:06.305Z"

  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    from_port        = "0"
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "-1"
    self             = "false"
    to_port          = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name   = "launch-wizard-6"
  vpc_id = "vpc-0861ff04ba04ae9bd"
}

resource "aws_security_group" "tfer--launch-wizard-7_sg-095927bca97cb50e1" {
  description = "launch-wizard-7 created 2025-06-08T17:16:34.551Z"

  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    from_port        = "0"
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "-1"
    self             = "false"
    to_port          = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name   = "launch-wizard-7"
  vpc_id = "vpc-0861ff04ba04ae9bd"
}
