variable "env" {
  default     = "dev"
  description = "This is the environment."
  type        = string
}

variable "project_name" {
  description = "This is the local project name."
  type        = string
}



# ----------------------------
# S3 Bucket Toggles & Info
# ----------------------------
variable "create_s3_bucket" {
  default     = false
  description = "True to create a s3 bucket."
  type        = bool
}

variable "custom_s3_bucket_name" {
  default     = null
  description = "This is the custom name for s3 bucket."
  type        = string
}




# ------------------------
# VPC Toggles & Info
# ------------------------
variable "create_vpc" {
  type    = bool
  default = true
}

variable "custom_vpc_name" {
  default = null
  type    = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["east-us-2a", "east-us-2b"]
}

# ------------------------
# Subnet Toggles
# ------------------------

variable "create_public_subnets" {
  type    = bool
  default = true
}

variable "create_private_subnets" {
  type    = bool
  default = false
}

variable "create_intra_subnets" {
  type    = bool
  default = false
}

# ------------------------
# Subnet CIDRs
# ------------------------

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "intra_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.201.0/24", "10.0.202.0/24"]
}

# ------------------------
# Internet Gateway
# ------------------------

variable "create_igw" {
  type    = bool
  default = true
}

# ------------------------
# Routing
# ------------------------

variable "create_route_tables" {
  type    = bool
  default = true
}


# ------------------------------------
# Security-groups Toggles & Info
# ------------------------------------
variable "create_sg" {
  type    = bool
  default = false
}

variable "custom_sg_name" {
  default = null
  type    = string
}



# ------------------------------------
# EC2 Toggles & Info
# ------------------------------------
variable "create_ec2" {
  default = false
  type = bool
}

variable "custom_ec2_instance_name" {
  description = "Name tag for EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "ec2_os_type" {
  description = "Defines type of OS in EC2."
  default = "linux"
  type = string
}

variable "linux_ami" {
  default = "ami-00e428798e77d38d9"
  type = string
}

variable "windows_ami" {
  default = "ami-013e43c5ba6d06126"
  type = string
}

variable "mac_ami" {
  default = "ami-05cfe9e308d1d84af"
  type = string
}

variable "key_name" {
  type = string
  description = "SSH key pair."
}

variable "ec2_public_ip" {
  type = bool
  default = true
}