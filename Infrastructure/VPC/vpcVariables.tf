variable "env" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "create_private_subnets" {
  default = false
  type = bool
}

variable "create_intra_subnets" {
  type = bool
  default = false
}
variable "azs" {
  type = list(string)
}

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

variable "create_igw" {
  type    = bool
  default = true
}
