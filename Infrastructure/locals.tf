locals {
  # ---------- AMI ----------
  ec2_ami_id = var.ec2_os_type == "linux" ? var.linux_ami : var.ec2_os_type == "windows" ? var.windows_ami : var.mac_ami

  # ---------- NAMES ----------
  normalized_s3_bucket_name = var.custom_s3_bucket_name != "" ? var.custom_s3_bucket_name : null
  s3_bucket_name            = coalesce(local.normalized_s3_bucket_name, "s3-{var.project_name}")
  vpc_name                  = coalesce(var.custom_vpc_name, "vpc-${var.project_name}")
  sg_name                   = coalesce(var.custom_sg_name, "${var.project_name}-sg")
  ec2_name                  = coalesce(var.custom_ec2_instance_name, "ec2-${var.project_name}")
  amplify_name              = coalesce(var.custom_amplify_app_name, "app-${var.project_name}")
  acm_name                  = coalesce(var.custom_acm_name, "acm-${var.project_name}")
  alb_name                  = coalesce(var.custom_alb_name, "alb-${var.project_name}")
  nlb_name                  = coalesce(var.custom_nlb_name, "nlb-${var.project_name}")
  rds_name                  = coalesce(var.custom_rds_name, replace("rds-${var.project_name}", "-", ""))
  ecr_name                  = coalesce(var.custom_ecr_name, "ecr-${var.project_name}")

  # ---------- BASE DEPENDENCIES ----------
  need_vpc     = var.create_vpc || var.create_ec2 || var.create_rds || var.create_alb || var.create_nlb || var.peer_vpc_to != null
  need_sg      = var.create_sg || var.create_ec2 || var.create_rds || var.create_alb
  need_keypair = var.create_ec2
  need_ec2     = var.create_ec2 || var.create_alb || var.create_nlb
  need_amplify = var.create_amplify_app || var.create_alb
  need_acm     = var.create_acm || var.create_alb
  need_alb     = var.create_alb && local.create_ec2_final && local.create_amplify_final && local.create_acm_final
  need_nlb     = var.create_nlb && local.create_ec2_final

  # ---------- FINAL CREATE FLAGS ----------
  create_s3_final         = var.create_s3_bucket
  create_vpc_final        = local.need_vpc
  create_sg_final         = local.need_sg
  create_keypair_final    = local.need_keypair
  create_ec2_final        = local.need_ec2
  create_amplify_final    = local.need_amplify
  create_acm_final        = local.need_acm
  create_alb_final        = local.need_alb
  create_nlb_final        = local.need_nlb
  create_rds_final        = var.create_rds
  create_vpc_peering      = var.peer_vpc_to != null
  create_monitoring_final = local.create_ec2_final
  create_ecr_final        = var.create_ecr


  # ---------- ICMP LOGIC ----------
  final_icmp_ingress_cidrs = concat(var.icmp_ingress_cidrs, var.peer_vpc_to != null ? [var.peer_vpc_to.cidr_block] : [])

}