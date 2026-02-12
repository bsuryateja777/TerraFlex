variable "env" {
  description = "Environment name, e.g., dev, prod"
  type        = string
  default     = "dev"
}

variable "nlb_name" {
  description = "Name prefix for the NLB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the NLB will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of public subnet IDs for the NLB"
  type        = list(string)
}

variable "instance_ids" {
  description = "List of EC2 instance IDs to attach to the NLB target group"
  type        = list(string)
}

variable "listener_port" {
  description = "Port on which the NLB listener will listen"
  type        = number
  default     = 443
}

variable "target_port" {
  description = "Port on which the NLB target group will forward traffic"
  type        = number
  default     = 443
}

variable "internal_nlb" {
  description = "Whether the NLB should be internal (true) or internet-facing (false)"
  type        = bool
  default     = false
}

variable "target_type" {
  description = "Target type for the NLB target group, e.g., 'instance' or 'ip'"
  type        = string
  default     = "instance"
}

variable "nlb_enable_cross_zone" {
  description = "Enable cross-zone load balancing for the NLB"
  type        = bool
  default     = false
}

variable "nlb_deletion_protection" {
  description = "Enable deletion protection for the NLB"
  type        = bool
  default     = false
}

variable "deregistration_delay" {
  description = "Time in seconds to wait before deregistering a target from the NLB"
  type        = number
  default     = 300
}