output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.vpc.cidr_block}"
}

output "bm_vpc_subnet_a_id" {
  value = "${aws_subnet.sn_a.id}"
}

output "bm_vpc_subnet_b_id" {
  value = "${aws_subnet.sn_b.id}"
}
