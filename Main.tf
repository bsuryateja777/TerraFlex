module "dev-flexing" {
  source = "./Infrastructure"

  project_name = "flexing"
  env          = "dev"

  create_s3_bucket      = true
  custom_s3_bucket_name = ""

  create_vpc      = true
  custom_vpc_name = ""
  # vpc_cidr = "10.0.0.0/16"
  # azs = [ "east-us-2a", "east-us-2b" ]
  create_public_subnets = true //default
  # public_subnet_cidrs = "[10.0.1.0/24"]
  create_private_subnets = false //deault
  # private_subnet_cidrs = ["10.0.101.0/24"]
  create_intra_subnets = false //deault
  # intra_subnet_cidrs = ["10.0.201.0/24"]

  create_sg = true

  create_ec2 = true
  ec2_public_ip = true

  create_amplify_app = true
  github_token = var.github_token
  custom_amplify_app_name = ""

}