resource "aws_s3_bucket" "this" {

  count = var.create_s3_bucket ? 1 : 0

  bucket = local.aws_s3_bucket_name

  tags = {
    Name        = local.aws_s3_bucket_name
    Environment = var.env
  }

}