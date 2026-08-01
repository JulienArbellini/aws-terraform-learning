resource "aws_security_group" "private" {

  name   = "private-server-security-group-${var.environment}"
  vpc_id = aws_vpc.main.id


  ingress {
    description = "SSH from bastion"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    security_groups = [
      aws_security_group.bastion.id
    ]
  }


  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "private-security-group-${var.environment}"
    }
  )
}