provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "${var.env}-vpc"
    Env         = "${var.env}"
    Description = "VPC ${var.env}"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.env}-ig"
    Env         = "${var.env}"
    Description = "Internet gateway"
  }
}

resource "aws_default_security_group" "def_sg" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.env}-sg"
    Env         = "${var.env}"
    Description = "VPC security group"
  }
}

resource "aws_default_network_acl" "def_nacl" {
  default_network_acl_id = "${aws_vpc.vpc.default_network_acl_id}"

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags {
    Name        = "${var.env}-nacl"
    Env         = "${var.env}"
    Description = "Default network ACL"
  }
}
