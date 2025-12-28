variable "env" {
  type    = string
  default = "dev"
}

variable "create_amplify_app" {
  type = bool
  default = false
}

variable "app_name" {
  type    = string
}

variable "github_repo" {
  type = string
  default = "https://github.com/bsuryateja777/RentEase.git"
}

variable "github_branch" {
  type = string
  default = "amplifytf"
}

variable "github_token" {
  type      = string
  sensitive = true
}
