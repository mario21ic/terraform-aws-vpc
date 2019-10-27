resource "aws_subnet" "sn_publics" {
  count = length(var.subnet_publics)

  vpc_id = aws_vpc.vpc.id

  //  cidr_block              = "${var.sn_public_1_cidr}"
  //  availability_zone       = "${var.region}${var.sn_public_1_az}"
  cidr_block        = var.subnet_publics[count.index]["cidr"]
  availability_zone = "${var.region}${var.subnet_publics[count.index]["zone"]}"

  #map_public_ip_on_launch = true

  tags = {
    Name        = "${var.env}-sn-public-${count.index}"
    Env         = var.env
    Description = "Subnet Public ${count.index}"
  }
}

resource "aws_subnet" "sn_privates" {
  count = length(var.subnet_privates)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_privates[count.index]["cidr"]
  availability_zone = "${var.region}${var.subnet_privates[count.index]["zone"]}"

  #map_public_ip_on_launch = true

  tags = {
    Name        = "${var.env}-sn-private-${count.index}"
    Env         = var.env
    Description = "Subnet Private ${count.index}"
  }
}

