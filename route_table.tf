/* Public */
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.env}-ig"
    Env         = var.env
    Description = "Internet gateway"
  }
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc.id

/*
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
*/

  tags = {
    Name        = "${var.env}-rt-public"
    Env         = var.env
    Description = "Default route table ${var.env}"
  }
}

resource "aws_route_table_association" "rt_association_publics" {
  count = length(var.subnet_publics)

  subnet_id      = aws_subnet.sn_publics.*.id[count.index]
  route_table_id = aws_route_table.rt_public.id
}

/* Private */
/*
resource "aws_eip" "nat" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "my_nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.sn_publics.*.id[0]
}
*/

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.vpc.id

/*
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gw.id
  }
*/

  tags = {
    Name        = "${var.env}-rt-private"
    Env         = var.env
    Description = "Default route table ${var.env}"
  }
}

resource "aws_route_table_association" "rt_association_private_1" {
  count = length(var.subnet_privates)

  subnet_id      = aws_subnet.sn_privates.*.id[count.index]
  route_table_id = aws_route_table.rt_private.id
}

