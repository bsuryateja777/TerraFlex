output "all_first_rts"{
    value = module.prd-first.vpc_a_rt_ids
}

output "all_second_rts" {
    value = module.prd-first.vpc_b_rt_ids
}