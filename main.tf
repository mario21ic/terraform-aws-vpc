provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "vpc_${var.name}"
    Class       = "vpc_${var.name}"
    Enviroment  = "${var.environment}"
    Description = "VPC ${var.name}"
  }
}

resource "aws_default_route_table" "def_rt" {
  default_route_table_id = "${aws_vpc.vpc.default_route_table_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.def_igw.id}"
  }

  tags {
    Name        = "def_rt"
    Class       = "def_rt"
    Enviroment  = "${var.environment}"
    Description = "Default route table"
  }
}

resource "aws_internet_gateway" "def_igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "def_igw"
    Class       = "def_igw"
    Enviroment  = "${var.environment}"
    Description = "Bookingmotor internet gateway"
  }
}

resource "aws_default_security_group" "def_sg" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "def_sg_${var.name}"
    Class       = "def_sg_${var.name}"
    Enviroment  = "${var.environment}"
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
    Name        = "bm_def_nacl"
    Class       = "bm_def_nacl"
    Enviroment  = "${var.environment}"
    Description = "Default network ACL"
  }
}

# vpc subnets

resource "aws_subnet" "sn_1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.cidr_subnet_1}"
  availability_zone       = "${var.subnet_1_availability_zone}"
  map_public_ip_on_launch = true

  tags {
    Name        = "sn_1"
    Class       = "sn_1"
    Enviroment  = "${var.environment}"
    Description = "Subnet 1"
  }
}

resource "aws_subnet" "sn_2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.cidr_subnet_2}"
  availability_zone       = "${var.subnet_2_availability_zone}"
  map_public_ip_on_launch = true

  tags {
    Name        = "sn_b"
    Class       = "sn_b"
    Enviroment  = "${var.environment}"
    Description = "Subnet 2"
  }
}
