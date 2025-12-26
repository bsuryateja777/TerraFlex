variable "env" {
  default = "dev"
  description = "This is the environment."
  type = string
}

variable "project_name" {
  description = "This is the local project name."
  type = string
}

variable "create_s3_bucket" {
  default = false
  description = "True to create a s3 bucket."
  type = bool
}

variable "custom_s3_bucket_name" {
  default = null
  description = "This is the custom name for s3 bucket."
  type = string
}