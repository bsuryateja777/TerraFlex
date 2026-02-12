variable "env" {
  description = "Deployment environment"
  type        = string
}

variable "sg_name" {
  description = "Security group name suffix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "icmp_ingress_cidrs" {
  description = "List of CIDRs allowed for ICMP ingress"
  type        = list(string)
}