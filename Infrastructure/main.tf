module "backend_state" {
  source = "./REMOTE-BACKEND"
  count  = var.enable_remote_backend_state ? 1 : 0

  env                 = var.env
  bucket_name         = "tfstate-terraflex-remote-backend"
  dynamodb_table_name = "dynamodb-terraflex-remote-backend-locks"
}


module "s3" {
  source = "./S3"
  count  = local.create_s3_final ? 1 : 0

  env                = var.env
  aws_s3_bucket_name = local.s3_bucket_name
}


module "vpc" {
  source = "./VPC"
  count  = local.create_vpc_final ? 1 : 0

  env                  = var.env
  vpc_name             = local.vpc_name
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  intra_subnet_cidrs   = var.intra_subnet_cidrs
  create_igw           = true
}


module "vpc_peering" {
  source = "./VPC-PEERING"
  count  = local.create_vpc_peering ? 1 : 0

  vpc_a_id = module.vpc[0].vpc_id
  vpc_b_id = var.peer_vpc_to.vpc_id

  vpc_a_cidr_block = var.vpc_cidr
  vpc_b_cidr_block = var.peer_vpc_to.cidr_block

  vpc_a_rt_id = module.vpc[0].public_route_table_id
  vpc_b_rt_id = var.peer_vpc_to.rt_id

  vpc_a_name = local.vpc_name
  vpc_b_name = var.peer_vpc_to.name
}


module "sg" {
  source = "./SECURITY-GROUPS"
  count  = local.create_sg_final ? 1 : 0

  env                = var.env
  sg_name            = local.sg_name
  vpc_id             = module.vpc[0].vpc_id
  icmp_ingress_cidrs = local.final_icmp_ingress_cidrs
}

module "keypair" {
  source = "./KEY-PAIR"
  count  = local.create_keypair_final ? 1 : 0

  project_name = var.project_name
}


module "ec2" {
  source = "./EC2"
  count  = local.create_ec2_final ? 1 : 0

  env                 = var.env
  ec2_instance_name   = local.ec2_name
  ami_id              = local.ec2_ami_id
  ec2_instance_type   = var.ec2_instance_type
  subnet_id           = module.vpc[0].public_subnet_ids[0]
  security_group_ids  = [module.sg[0].security_group_id]
  key_name            = module.keypair[0].key_name
  associate_public_ip = var.ec2_public_ip
}


module "amplify" {
  source = "./AMPLIFY"
  count  = local.create_amplify_final ? 1 : 0

  env          = var.env
  app_name     = local.amplify_name
  github_token = var.github_token
}


module "certificate" {
  source = "./ACM"
  count  = local.create_acm_final ? 1 : 0

  env         = var.env
  acm_name    = local.acm_name
  domain_name = var.acm_domain
}


module "alb" {
  source = "./ALB"
  count  = local.create_alb_final ? 1 : 0

  env                  = var.env
  alb_name             = local.alb_name
  security_group_ids   = [module.sg[0].security_group_id]
  vpc_id               = module.vpc[0].vpc_id
  public_subnet_ids    = module.vpc[0].public_subnet_ids
  frontend_instance_id = module.amplify[0].amplify_app_id
  backend_instance_id  = module.ec2[0].instance_id
  certificate_arn      = module.certificate[0].certificate_arn
}


module "nlb" {
  source = "./NLB"
  count  = local.create_nlb_final ? 1 : 0

  env                     = var.env
  nlb_name                = local.nlb_name
  vpc_id                  = module.vpc[0].vpc_id
  subnet_ids              = module.vpc[0].public_subnet_ids
  instance_ids            = [module.ec2[0].instance_id]
  nlb_enable_cross_zone   = var.nlb_enable_cross_zone
  nlb_deletion_protection = var.nlb_deletion_protection
}


module "rds" {
  source = "./RDS"
  count  = local.create_rds_final ? 1 : 0

  env         = var.env
  db_name     = local.rds_name
  db_username = var.rds_username
  db_password = var.rds_password

  engine            = var.rds_engine
  engine_version    = var.rds_engine_version
  instance_class    = var.rds_instance_class
  allocated_storage = var.rds_allocated_storage

  rds_security_group_ids = [module.sg[0].security_group_id]
  subnet_ids             = module.vpc[0].private_subnet_ids

}