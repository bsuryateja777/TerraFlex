resource "aws_s3_bucket" "this" {
  bucket = local.aws_s3_bucket_name

  tags = {
    Name        = local.aws_s3_bucket_name
    Environment = var.env
  }
}
