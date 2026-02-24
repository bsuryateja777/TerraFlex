# ------------------------
# General / Project Info
# ------------------------
variable "env" {
  type        = string
  default     = "dev"
  description = "Environment name, e.g., dev, prod, stage."
}

variable "project_name" {
  type        = string
  description = "Local project name used as default for resource naming."
}

variable "enable_remote_backend_state" {
  type        = bool
  default     = false
  description = "Whether to enable remote backend state storage."
}

variable "region" {
  type        = string
  default     = "east-us-2"
  description = ""
}

# ------------------------
# S3 Bucket Toggles & Info
# ------------------------
variable "create_s3_bucket" {
  type        = bool
  default     = false
  description = "Set to true to create an S3 bucket."
}

variable "custom_s3_bucket_name" {
  type        = string
  default     = null
  description = "Optional custom name for the S3 bucket. If not provided, project_name is used."
}

# ------------------------
# VPC Toggles & Info
# ------------------------
variable "create_vpc" {
  type        = bool
  default     = false
  description = "Set to true to create a VPC."
}

variable "custom_vpc_name" {
  type        = string
  default     = null
  description = "Optional custom name for the VPC. Defaults to project_name if not provided."
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC."
}

variable "azs" {
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"]
  description = "List of availability zones for the VPC subnets."
}

variable "peer_vpc_to" {
  type = object({
    name            = string
    vpc_id          = string
    cidr_block      = string
    route_table_ids = list(string)
  })
  default     = null
  description = "Optional information about a VPC to peer with."
}


# ------------------------
# Subnet Toggles
# ------------------------
variable "create_public_subnets" {
  type        = bool
  default     = false
  description = "Create public subnets in the VPC."
}

variable "create_private_subnets" {
  type        = bool
  default     = false
  description = "Create private subnets in the VPC."
}

variable "create_intra_subnets" {
  type        = bool
  default     = false
  description = "Create intra-service subnets for internal communication."
}

# ------------------------
# Subnet CIDRs
# ------------------------
variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "List of CIDR blocks for public subnets."
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
  description = "List of CIDR blocks for private subnets."
}

variable "intra_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.201.0/24", "10.0.202.0/24"]
  description = "List of CIDR blocks for intra-service subnets."
}

# ------------------------
# Internet Gateway
# ------------------------
variable "create_igw" {
  type        = bool
  default     = false
  description = "Create an Internet Gateway for the VPC."
}

# ------------------------
# Routing
# ------------------------
variable "create_route_tables" {
  type        = bool
  default     = false
  description = "Create route tables for the VPC subnets."
}

# ------------------------
# Security Groups
# ------------------------
variable "create_sg" {
  type        = bool
  default     = false
  description = "Create security groups for resources."
}

variable "custom_sg_name" {
  type        = string
  default     = null
  description = "Optional custom name for security groups. Defaults to project_name."
}

variable "icmp_ingress_cidrs" {
  description = "List of CIDRs allowed for ICMP"
  type        = list(string)
  default     = []
}


# ------------------------
# EC2
# ------------------------
variable "create_ec2" {
  type        = bool
  default     = false
  description = "Set to true to create an EC2 instance."
}

variable "custom_ec2_instance_name" {
  type        = string
  default     = null
  description = "Optional custom name for EC2 instance. Defaults to project_name."
}

variable "ec2_instance_type" {
  type        = string
  default     = "t3.small"
  description = "EC2 instance type (e.g., t3.small)."
}

variable "ec2_os_type" {
  type        = string
  default     = "linux"
  description = "Operating system type for EC2 instance (linux/windows/mac)."
}

variable "linux_ami" {
  type        = string
  default     = "ami-00e428798e77d38d9"
  description = "Default Linux AMI ID."
}

variable "windows_ami" {
  type        = string
  default     = "ami-013e43c5ba6d06126"
  description = "Default Windows AMI ID."
}

variable "mac_ami" {
  type        = string
  default     = "ami-05cfe9e308d1d84af"
  description = "Default Mac AMI ID."
}

variable "key_name" {
  type        = string
  default     = null
  description = "Name of the SSH key pair to use for EC2."
}

variable "ec2_public_ip" {
  type        = bool
  default     = false
  description = "Attach a public IP to the EC2 instance if true."
}

# ------------------------
# Amplify
# ------------------------
variable "create_amplify_app" {
  type        = bool
  default     = false
  description = "Set to true to create an Amplify app."
}

variable "custom_amplify_app_name" {
  type        = string
  default     = null
  description = "Optional custom name for Amplify app. Defaults to project_name."
}

variable "github_token" {
  type        = string
  default     = null
  description = "GitHub personal access token for Amplify integration."
}

# ------------------------
# ACM (Certificate Manager)
# ------------------------
variable "create_acm" {
  type        = bool
  default     = false
  description = "Set to true to create an ACM certificate."
}

variable "custom_acm_name" {
  type        = string
  default     = null
  description = "Optional custom name for ACM certificate. Defaults to project_name."
}

variable "acm_domain" {
  default     = "rentease-api.api.com"
  type        = string
  description = "Domain name for ACM certificate."
}

# ------------------------
# ALB
# ------------------------
variable "create_alb" {
  type        = bool
  default     = false
  description = "Set to true to create an Application Load Balancer."
}

variable "custom_alb_name" {
  type        = string
  default     = null
  description = "Optional custom name for ALB. Defaults to project_name."
}

variable "frontend_port" {
  type    = number
  default = 80
}

variable "backend_port" {
  type    = number
  default = 4000
}

variable "target_type" {
  type    = string
  default = "ec2"
}

variable "enable_frontend_alb" {
  type    = bool
  default = false
}

variable "enable_backend_alb" {
  type    = bool
  default = false
}

variable "enable_https" {
  type    = bool
  default = false
}

# ------------------------
# NLB
# ------------------------
variable "create_nlb" {
  type        = bool
  default     = false
  description = "Set to true to create a Network Load Balancer."
}

variable "custom_nlb_name" {
  type        = string
  default     = null
  description = "Optional custom name for NLB. Defaults to project_name."
}

variable "nlb_enable_cross_zone" {
  type        = bool
  default     = false
  description = "Enable cross-zone load balancing for NLB."
}

variable "nlb_deletion_protection" {
  type        = bool
  default     = false
  description = "Enable deletion protection for NLB."
}

# ------------------------
# RDS
# ------------------------
variable "create_rds" {
  type        = bool
  default     = false
  description = "Set to true to create an RDS database."
}

variable "custom_rds_name" {
  type        = string
  default     = null
  description = "Optional custom name for RDS instance. Defaults to project_name."
}

variable "rds_username" {
  type        = string
  default     = "admin"
  description = "Master username for RDS database."
}

variable "rds_password" {
  type        = string
  default     = "admin12345"
  description = "Master password for RDS database."
}

variable "rds_engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}

variable "rds_engine_version" {
  description = "Database engine version"
  type        = string
  default     = "15.4"
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 20
}


# ------------------------
# Central Monitoring
# ------------------------
variable "log_retention_days" {
  type    = number
  default = 30
}

variable "enable_monitoring" {
  type    = bool
  default = true
}

variable "alert_email" {
  type    = string
  default = "bsuryateja777@gmail.com"
}


# ------------------------
# ECR
# ------------------------

variable "create_ecr" {
  default     = false
  type        = bool
  description = "set to true to create an ECR repository."
}

variable "custom_ecr_name" {
  default     = null
  type        = string
  description = "optional custom name variable to name your ECR."
}

# ------------------------
# ECS
# ------------------------

variable "create_ecs" {
  default = false
  type    = bool
}

variable "custom_ecs_name" {
  default = null
  type    = string
}

variable "container_image" {
  default = "nginx:latest"
  type    = string
}