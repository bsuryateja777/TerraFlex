output "vpc_id" {
  value = length(module.vpc) > 0 ? module.vpc[0].vpc_id : null
}

output "vpc_cidr_block" {
  value = length(module.vpc) > 0 ? module.vpc[0].vpc_cidr_block : null
}

output "vpc_a_rt_ids" {
  value = local.create_vpc_peering ? module.vpc_peering[0].vpc_a_route_table_ids : null
}

output "vpc_b_rt_ids" {
  value = local.create_vpc_peering ? module.vpc_peering[0].vpc_b_route_table_ids : null
}