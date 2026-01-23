variable "project_name" {
  description = "Base name for key pair"
  type        = string
}

variable "create_key_pair" {
  description = "Whether to create a key pair"
  type        = bool
  default     = false
}