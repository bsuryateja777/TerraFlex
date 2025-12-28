module "s3" {
  source = "./S3"

  env = var.env

  create_s3_bucket   = var.create_s3_bucket
  aws_s3_bucket_name = var.custom_s3_bucket_name != null && var.custom_s3_bucket_name != "" ? var.custom_s3_bucket_name : var.project_name
}

module "vpc" {
  source = "./VPC"

  env = var.env

  create_vpc = var.create_vpc
  vpc_name   = var.custom_vpc_name != null && var.custom_vpc_name != "" ? var.custom_vpc_name : var.project_name
  vpc_cidr   = var.vpc_cidr

  azs = var.azs

  create_public_subnets = var.create_public_subnets
  public_subnet_cidrs   = var.public_subnet_cidrs

  create_private_subnets = var.create_private_subnets
  private_subnet_cidrs   = var.private_subnet_cidrs

  create_intra_subnets = var.create_intra_subnets
  intra_subnet_cidrs   = var.intra_subnet_cidrs
}


module "sg" {
  source = "./SECURITY-GROUPS"

  env = var.env

  create_sg = var.create_sg
  sg_name   = var.custom_sg_name != null && var.custom_sg_name != "" ? var.custom_sg_name : var.project_name
  vpc_id    = module.vpc.vpc_id
}

module "keypair" {
  source = "./KEY-PAIR"
  
  project_name   = var.project_name
}

module "ec2" {
  source = "./EC2"

  env = var.env

  create_ec2_instance = var.create_ec2
  ec2_instance_name = var.custom_ec2_instance_name != null && var.custom_ec2_instance_name != "" ? var.custom_ec2_instance_name : var.project_name
  ami_id = local.ec2_ami_id
  ec2_instance_type = var.ec2_instance_type
  subnet_id = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.sg.security_group_id]
  key_name           = module.keypair.key_name
  associate_public_ip = var.ec2_public_ip
}

module "amplify" {
  source = "./AMPLIFY"

  env = var.env

  create_amplify_app = var.create_amplify_app
  app_name = var.custom_amplify_app_name != null && var.custom_amplify_app_name != "" ? var.custom_amplify_app_name : var.project_name
  github_token = var.github_token

}