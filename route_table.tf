/* Public */
resource "aws_route_table" "rt_public" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.my_igw.id}"
  }

  tags {
    Name        = "${var.env}-rt-public"
    Env         = "${var.env}"
    Description = "Default route table ${var.env}"
  }
}

resource "aws_route_table_association" "rt_association_publics" {
  count = "${length(var.subnet_publics)}"

  subnet_id = "${element(aws_subnet.sn_publics.*.id, count.index)}"
  route_table_id = "${aws_route_table.rt_public.id}"
}

/* Private */
//resource "aws_eip" "eip_nat_gw" {
//  vpc = true
//}
data "aws_eip" "booking" {
  public_ip = "${var.gateway_public_ip}"
}

resource "aws_nat_gateway" "my_nat_gw" {
  allocation_id = "${data.aws_eip.booking.id}"
  subnet_id     = "${element(aws_subnet.sn_publics.*.id, 0)}"
}

resource "aws_route_table" "rt_private" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.my_nat_gw.id}"
  }

  tags {
    Name        = "${var.env}-rt-private"
    Env         = "${var.env}"
    Description = "Default route table ${var.env}"
  }
}

resource "aws_route_table_association" "rt_association_private_1" {
  count     = "${length(var.subnet_privates)}"

  subnet_id = "${element(aws_subnet.sn_privates.*.id, count.index)}"
  route_table_id = "${aws_route_table.rt_private.id}"
}
