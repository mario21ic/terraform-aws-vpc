output "id" {
  value = "${aws_vpc.vpc.id}"
}

output "cidr" {
  value = "${aws_vpc.vpc.cidr_block}"
}

output "public_subnet_ids" {
  value = "${aws_subnet.sn_publics.*.id}"
}
output "private_subnet_ids" {
  value = "${aws_subnet.sn_privates.*.id}"
}

output "route_table_public" {
  value = "${aws_route_table.rt_public.id}"
}

output "route_table_private" {
  value = "${aws_route_table.rt_private.id}"
}