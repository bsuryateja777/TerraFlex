variable "env" {
  type = string  
  default = "dev"
}

variable "create_vpc" {
  type    = bool
  default = true
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type = list(string)
  default = [ "east-us-2a", "east-us-2b" ]
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
  default = []
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = []
}

variable "intra_subnet_cidrs" {
  type    = list(string)
  default = []
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