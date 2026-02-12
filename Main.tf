module "prd-remote-backend" {
  source = "./Infrastructure"

  project_name = "remote-backend"
  env          = "prd"

  enable_remote_backend_state = true

}


module "prd-first" {
  source = "./Infrastructure"

  project_name = "first"
  env          = "prd"

  create_s3_bucket      = true
  custom_s3_bucket_name = "prd-first"

  create_vpc      = true
  custom_vpc_name = "prd-first"
  vpc_cidr        = "192.168.0.0/22"
  azs             = ["us-east-2a"]

  create_public_subnets = true
  public_subnet_cidrs   = ["192.168.0.0/26"]

  create_private_subnets = true
  private_subnet_cidrs   = ["192.168.1.0/26"]

  create_intra_subnets = true
  intra_subnet_cidrs   = ["192.168.2.0/28"]

  //vpc peering is success

  create_sg      = true
  custom_sg_name = "prd-first-sg"

  create_ec2               = true
  custom_ec2_instance_name = "prd-first-ec2"
  ec2_public_ip            = true
  ec2_os_type              = "linux"

  # icmp_ingress_cidrs = ["192.168.4.0/22"] //CIDRs of peered VPC for ICMP rule in SG (ingress)

  create_amplify_app      = true
  custom_amplify_app_name = "prd-first-amplify"
  github_token            = var.github_token

  create_alb      = true
  custom_alb_name = "prd-first-alb"
  create_acm      = true
  custom_acm_name = "prd-first-acm"

  create_nlb              = true
  custom_nlb_name         = "prd-first-nlb"
  nlb_enable_cross_zone   = true // cross-zone load balancing across azs
  nlb_deletion_protection = false

  create_rds            = true
  custom_rds_name       = "prd-first-rds"
  rds_username          = "admin"
  rds_password          = "Admin123!"
  rds_engine            = "mysql"
  rds_engine_version    = "8.0"
  rds_instance_class    = "db.t3.micro"
  rds_allocated_storage = "20"

}

# module "prd-second" {
#   source = "./Infrastructure"

#   project_name = "second"
#   env          = "prd"

#   create_vpc      = true
#   custom_vpc_name = "prd-second"
#   vpc_cidr        = "192.168.4.0/22"
#   azs             = ["us-east-2a"]

#   create_public_subnets = true
#   public_subnet_cidrs   = ["192.168.4.0/26"]

#   create_private_subnets = true
#   private_subnet_cidrs   = ["192.168.5.0/26"]

#   create_intra_subnets = true
#   intra_subnet_cidrs   = ["192.168.6.0/28"]

#   peer_vpc_to = {
#     name       = "vpc-prd-first"
#     vpc_id     = "vpc-0360f5652b85cc769"
#     cidr_block = "192.168.0.0/22"
#     rt_id      = "rtb-0b15c9e9d669e26e3" //public route table of vpc-prd-first
#   }

#   create_sg = true

#   create_ec2    = true
#   ec2_public_ip = true
#   ec2_os_type   = "linux"

# }