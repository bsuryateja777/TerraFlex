provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.aws_REGION

  default_tags {
    tags = {
      Project   = "Terra Flex"
      Owner     = "Surya Teja Reddy"
      ManagedBy = "Terraform"
    }
  }
}