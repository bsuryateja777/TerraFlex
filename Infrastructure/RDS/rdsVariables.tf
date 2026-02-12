variable "env" {
  description = "Deployment environment (dev, prod, etc.)"
  type        = string
}

variable "db_name" {
  description = "Base name for the RDS instance"
  type        = string
}

variable "db_username" {
  description = "Master database username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Master database password"
  type        = string
  sensitive   = true
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "15.4"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 20
}

variable "rds_security_group_ids" {
  description = "Security group IDs for RDS"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Private subnet IDs for RDS subnet group"
  type        = list(string)
}
