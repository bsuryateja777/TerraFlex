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

  create_private_subnets = var.create_private_subnets
  private_subnet_cidrs = var.private_subnet_cidrs

  create_intra_subnets   = var.create_intra_subnets
  intra_subnet_cidrs   = var.intra_subnet_cidrs
  
  create_igw           = true
}


module "vpc_peering" {
  source = "./VPC-PEERING"
  count  = local.create_vpc_peering ? 1 : 0

  vpc_a_id = module.vpc[0].vpc_id
  vpc_b_id = var.peer_vpc_to
}


module "sg" {
  source = "./SECURITY-GROUPS"
  count  = local.create_sg_final && length(module.vpc) > 0 ? 1 : 0

  env                = var.env
  sg_name            = local.sg_name
  vpc_id             = try(module.vpc[0].vpc_id, null)
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

  env                       = var.env
  ec2_instance_name         = local.ec2_name
  ami_id                    = local.ec2_ami_id
  ec2_instance_type         = var.ec2_instance_type
  subnet_id                 = module.vpc[0].public_subnet_ids[0]
  security_group_ids        = [module.sg[0].security_group_id]
  key_name                  = module.keypair[0].key_name
  associate_public_ip       = var.ec2_public_ip
  monitoring_log_group_name = module.monitoring[0].log_group_name
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

  env                = var.env
  alb_name           = local.alb_name
  security_group_ids = [module.sg[0].security_group_id]
  vpc_id             = module.vpc[0].vpc_id
  public_subnet_ids  = module.vpc[0].public_subnet_ids

  instance_id     = local.create_ec2_final ? module.ec2[0].instance_id : null
  enable_https    = var.enable_https
  certificate_arn = local.create_acm_final ? module.certificate[0].certificate_arn : null
  target_type     = local.create_ecs_final ? "ecs" : "ec2"

  enable_frontend = var.enable_frontend_alb
  enable_backend  = var.enable_backend_alb


  frontend_port = var.frontend_port
  backend_port  = var.backend_port
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

module "monitoring" {
  source = "./MONITORING"

  count = local.create_monitoring_final ? 1 : 0

  project_name       = var.project_name
  log_retention_days = 30
  alert_email        = var.alert_email
  ec2_instance_id    = local.create_ec2_final ? module.ec2[0].instance_id : null

}

module "ecr" {
  source = "./ECR"

  count = local.create_ecr_final ? 1 : 0

  ecr_name    = local.ecr_name
  environment = var.env
}

module "ecs" {
  source = "./ECS"

  count = local.create_ecs_final ? 1 : 0

  ecs_name = local.ecs_name
  region   = var.region

  vpc_id            = module.vpc[0].vpc_id
  private_subnets   = module.vpc[0].private_subnet_ids
  security_group_id = module.sg[0].security_group_id

  aws_cloudwatch_log_group_name = module.monitoring[0].log_group_name
  alb_listener_arn              = module.alb[0].http_listener_arn
  container_image               = var.container_image

}

module "apprunner" {
  source = "./APP-RUNNER"

  count = local.create_app_runner_final ? 1 : 0

  app_runner_name = local.app_runner_name
  ecr_repo_url    = module.ecr[0].repository_url
  container_port  = var.container_port
}