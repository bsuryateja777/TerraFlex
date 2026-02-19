variable "project_name" {
  type = string
}

variable "log_retention_days" {
  type    = number
  default = 30
}

variable "enable_cloudtrail" {
  type    = bool
  default = true
}

variable "alert_email" {
  type = string
  default = "bsuryateja777@gmail.com"
}

variable "ec2_instance_id" {
  type = string
}