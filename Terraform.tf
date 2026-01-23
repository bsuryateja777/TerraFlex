terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.48.0"
    }
  }

  backend "s3" {
    bucket         = "tfstate-terraflex-remote-backend"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "dynamodb-terraflex-remote-backend-locks"
    encrypt        = true
  }
}