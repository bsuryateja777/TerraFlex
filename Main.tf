module "prd-remote-backend" {
  source = "./Infrastructure"

  project_name = "remote-backend"
  env          = "prd"

  enable_remote_backend_state = true

}


module "prd-first" {
  source = "./Infrastructure"

  region = "east-us-2"

  project_name = "first"
  env          = "prd"

  create_s3_bucket      = false
  custom_s3_bucket_name = "prd-first"

  create_vpc      = true
  custom_vpc_name = "prd-first"
  vpc_cidr        = "192.168.0.0/22"
  azs             = ["us-east-2a", "us-east-2b"]

  create_public_subnets = true
  public_subnet_cidrs   = ["192.168.0.0/26", "192.168.0.64/26"]

  create_private_subnets = false
  private_subnet_cidrs   = ["192.168.1.0/26", "192.168.1.64/26"]

  create_intra_subnets = false
  intra_subnet_cidrs   = ["192.168.2.0/28", "192.168.2.16/28"]

  //vpc peering is success

  create_sg      = true
  custom_sg_name = "first-sg"

  create_ec2               = true
  custom_ec2_instance_name = "first-ec2"
  ec2_public_ip            = true
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

  create_ecr      = false
  custom_ecr_name = "ecr-first"

  create_ecs      = false
  custom_ecs_name = "ecs-first"

  enable_backend_alb  = false
  enable_frontend_alb = false

  create_app_runner = false
}

module "prd-second" {
  source = "./Infrastructure"

  project_name = "second"
  env          = "prd"

  create_vpc      = true
  custom_vpc_name = "prd-second"
  vpc_cidr        = "192.168.4.0/22"
  azs             = ["us-east-2a", "us-east-2b"]

  create_public_subnets = true
  public_subnet_cidrs   = ["192.168.4.0/26", "192.168.4.64/26"]

  create_private_subnets = false
  private_subnet_cidrs   = ["192.168.5.0/26", "192.168.5.64/26"]

  create_intra_subnets = false
  intra_subnet_cidrs   = ["192.168.6.0/28", "192.158.6.16/28"]

  peer_vpc_to = module.prd-first.vpc_id
  icmp_ingress_cidrs = ["192.168.0.0/22"] //CIDRs of peered VPC for ICMP rule in SG (ingress)

  create_sg = true

  create_ec2    = true
  ec2_public_ip = true
  ec2_os_type   = "linux"
}