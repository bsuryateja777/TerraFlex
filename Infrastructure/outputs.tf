output "vpc_id" {
  value = length(module.vpc) > 0 ? module.vpc[0].vpc_id : null
}

output "vpc_cidr_block" {
  value = length(module.vpc) > 0 ? module.vpc[0].vpc_cidr_block : null
}

output "all_route_table_ids" {
  value = length(module.vpc) > 0 ? module.vpc[0].all_route_table_ids : []
}