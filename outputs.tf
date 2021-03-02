output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "subnet_public_ids" {
  value = aws_subnet.sn_publics.*.id
}

output "subnet_private_ids" {
  value = aws_subnet.sn_privates.*.id
}

output "route_table_public" {
  value = aws_route_table.rt_public.id
}

output "route_table_private" {
  value = aws_route_table.rt_private.id
}

