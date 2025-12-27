module "s3" {
    source = "./S3"

    env = var.env

    create_s3_bucket = var.create_s3_bucket
    aws_s3_bucket_name = var.custom_s3_bucket_name != null ? var.custom_s3_bucket_name : var.project_name
}

module "vpc" {
    source = "./VPC"
    
    env = var.env

    create_vpc = var.create_vpc
    vpc_name = var.custom_vpc_name != null ? var.custom_vpc_name : var.project_name
    vpc_cidr = var.vpc_cidr

    azs = var.azs

    create_public_subnets = var.create_public_subnets
    public_subnet_cidrs = var.public_subnet_cidrs

    create_private_subnets = var.create_private_subnets
    private_subnet_cidrs = var.private_subnet_cidrs

    create_intra_subnets =var.create_intra_subnets
    intra_subnet_cidrs = var.intra_subnet_cidrs
}


module "sg" {
  source = "./SECURITY-GROUPS"

  env = var.env

  create_sg = var.create_sg
  sg_name = var.custom_sg_name != null ? var.custom_sg_name : var.project_name
  vpc_id = module.vpc.vpc_id
}