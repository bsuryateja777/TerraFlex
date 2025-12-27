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