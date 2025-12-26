module "s3" {
    source = "./S3"

    env = var.env

    create_s3_bucket = var.create_s3_bucket
    aws_s3_bucket_name = var.custom_s3_bucket_name != null ? var.custom_s3_bucket_name : var.project_name
}