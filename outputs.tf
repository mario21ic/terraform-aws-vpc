output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.vpc.cidr_block}"
}

output "bm_vpc_subnet_1_id" {
  value = "${aws_subnet.sn_1.id}"
}

output "bm_vpc_subnet_2_id" {
  value = "${aws_subnet.sn_2.id}"
}
