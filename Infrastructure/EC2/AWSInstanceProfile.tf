resource "aws_iam_instance_profile" "this" {
  name = "${local.aws_ec2_instance_name}-instance-profile"
  role = aws_iam_role.this.name
}