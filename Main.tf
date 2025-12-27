module "dev-flexing" {
    source = "./Infrastructure"

    project_name = "flexing"
    env = "dev"

    create_s3_bucket = true
    custom_s3_bucket_name = "first-bucket"
}