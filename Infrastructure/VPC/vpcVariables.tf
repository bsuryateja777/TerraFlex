variable "env" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
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
