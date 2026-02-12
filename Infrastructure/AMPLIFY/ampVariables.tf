variable "env" {
  description = "Deployment environment (dev, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "create_amplify_app" {
  description = "Whether to create Amplify app"
  type        = bool
  default     = false
}

variable "app_name" {
  description = "Amplify app name prefix"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository URL for Amplify app"
  type        = string
  default     = "https://github.com/bsuryateja777/RentEase.git"
}

variable "github_branch" {
  description = "GitHub branch to deploy in Amplify"
  type        = string
  default     = "amplifytf"
}

variable "github_token" {
  description = "GitHub OAuth token"
  type        = string
  sensitive   = true
}
