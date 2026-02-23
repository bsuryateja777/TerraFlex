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

  create_s3_bucket      = false
  custom_s3_bucket_name = "prd-first"

  create_vpc      = false
  custom_vpc_name = "prd-first"
  vpc_cidr        = "192.168.0.0/22"
  azs             = ["us-east-2a", "us-east-2b"]

  create_public_subnets = false
  public_subnet_cidrs   = ["192.168.0.0/26", "192.168.0.64/26"]

  create_private_subnets = false
  private_subnet_cidrs   = ["192.168.1.0/26", "192.168.1.64/26"]

  create_intra_subnets = false
  intra_subnet_cidrs   = ["192.168.2.0/28", "192.168.2.16/28"]

  //vpc peering is success

  create_sg      = false
  custom_sg_name = "prd-first-sg"

  create_ec2               = false
  custom_ec2_instance_name = "prd-first-ec2"
  ec2_public_ip            = false
  ec2_os_type              = "linux"

  icmp_ingress_cidrs = ["192.168.4.0/22"] //CIDRs of peered VPC for ICMP rule in SG (ingress)

  # # icmp_ingress_cidrs = ["192.168.4.0/22"] //CIDRs of peered VPC for ICMP rule in SG (ingress)

  # create_amplify_app      = false
  # custom_amplify_app_name = "prd-first-amplify"
  # github_token            = var.github_token

  # create_alb      = false
  # custom_alb_name = "prd-first-alb"

  # create_acm      = false
  # custom_acm_name = "prd-first-acm"
  # acm_domain      = "example.com"


  # create_nlb              = false
  # custom_nlb_name         = "prd-first-nlb"
  # nlb_enable_cross_zone   = false // cross-zone load balancing across azs
  # nlb_deletion_protection = false

  # create_rds            = false
  # custom_rds_name       = "prd-first-rds"
  # rds_username          = "admin"
  # rds_password          = "Admin123!"
  # rds_engine            = "mysql"
  # rds_engine_version    = "8.0"
  # rds_instance_class    = "db.t3.micro"
  # rds_allocated_storage = "20"

  create_ecr      = true
  custom_ecr_name = "ecr-first"

}

module "prd-second" {
  source = "./Infrastructure"

  project_name = "second"
  env          = "prd"

  create_vpc      = false
  custom_vpc_name = "prd-second"
  vpc_cidr        = "192.168.4.0/22"
  azs             = ["us-east-2a"]

  create_public_subnets = false
  public_subnet_cidrs   = ["192.168.4.0/26"]

  create_private_subnets = false
  private_subnet_cidrs   = ["192.168.5.0/26"]

  create_intra_subnets = false
  intra_subnet_cidrs   = ["192.168.6.0/28"]

  # peer_vpc_to = {
  #   name            = "vpc-prd-first"
  #   vpc_id          = module.prd-first.vpc_id
  #   cidr_block      = "192.168.0.0/22"
  #   route_table_ids = module.prd-first.all_route_table_ids
  # }

  create_sg = false

  create_ec2    = false
  ec2_public_ip = false
  ec2_os_type   = "linux"

}