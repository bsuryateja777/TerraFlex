resource "aws_amplify_app" "this" {

  count = var.create_amplify_app ? 1 : 0

  name        = var.app_name
  repository  = var.github_repo
  oauth_token = var.github_token

  platform = "WEB"

  enable_branch_auto_build    = true
  enable_auto_branch_creation = false

  environment_variables = {
    ENV               = var.env
    VITE_API_BASE_URL = "http://ec2-3-135-190-120.us-east-2.compute.amazonaws.com:4000"

  }

  tags = {
    Name        = local.aws_amplify_app_name
    Environment = var.env
  }
}

resource "aws_amplify_branch" "this" {

  count = var.create_amplify_app ? 1 : 0

  app_id      = aws_amplify_app.this[count.index].id
  branch_name = var.github_branch

  enable_auto_build = true
  stage             = "PRODUCTION"

  environment_variables = {
    NODE_ENV          = "production"
    VITE_API_BASE_URL = "https://rentease-app.ddns.net/api"
  }
}
