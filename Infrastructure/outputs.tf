output "vpc_id" {
  value = module.vpc[0].vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc[0].vpc_cidr_block
}

output "all_route_table_ids" {
  value = module.vpc[0].all_route_table_ids
}