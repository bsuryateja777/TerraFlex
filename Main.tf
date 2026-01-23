module "prd-remote-backend" {
  source = "./Infrastructure"

  project_name = "remote-backend"
  env          = "prd"

  enable_remote_backend_state = true

}


module "dev-flexing" {
  source = "./Infrastructure"

  project_name = "flexing"
  env          = "dev"

  create_s3_bucket      = false
  custom_s3_bucket_name = ""

  create_vpc      = false
  custom_vpc_name = ""
  # vpc_cidr = "10.0.0.0/16"
  # azs = [ "east-us-2a", "east-us-2b" ]
  create_public_subnets = false //default
  # public_subnet_cidrs = "[10.0.1.0/24"]
  create_private_subnets = false //deault
  # private_subnet_cidrs = ["10.0.101.0/24"]
  create_intra_subnets = false //deault
  # intra_subnet_cidrs = ["10.0.201.0/24"]

  create_sg = false

  create_ec2    = false
  ec2_public_ip = false

  create_amplify_app      = false
  github_token            = var.github_token
  custom_amplify_app_name = ""

  create_acm      = false
  custom_acm_name = ""

  create_alb      = false
  custom_alb_name = ""

  create_nlb              = false
  custom_nlb_name         = ""
  nlb_enable_cross_zone   = false
  nlb_deletion_protection = false

}