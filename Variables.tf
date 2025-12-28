variable "AWS_ACCESS_KEY" {
  type        = string
  description = "This value is defined to parse the access key."
  sensitive   = true
}

variable "AWS_SECRET_KEY" {
  type        = string
  description = "This value is defined to parse the secret key."
  sensitive   = true
}

variable "aws_REGION" {
  type        = string
  default     = "us-east-2"
  description = "This variable lets you define the region for your resources."
}

variable "github_token" {
  type = string
  description = "Personal access token for rentease app."
  sensitive = true
}