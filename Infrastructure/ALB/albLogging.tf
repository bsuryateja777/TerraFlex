resource "random_id" "this" {
  byte_length = 4
}

resource "aws_s3_bucket" "this" {
  bucket        = "terraflex-alb-logs-${random_id.this.hex}"
  force_destroy = true
}


resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::033677994240:root"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.this.arn}/*"
      }
    ]
  })
}