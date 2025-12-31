variable "env" {
  type    = string
  default = "prod"
}

variable "acm_name" {
  type    = string
  default = "tp"
}

variable "create_acm" {
  type = bool
}

variable "domain_name" {
  description = "Main domain name for frontend and backend"
  type        = string
  default     = "rentease-app.ddns.net"
}