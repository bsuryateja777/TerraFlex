resource "aws_security_group_rule" "allow_icmp" {
  for_each = toset(var.icmp_ingress_cidrs)

  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = [each.value]
  security_group_id = aws_security_group.this.id

  description = "Allow ICMP from ${each.value}"
}