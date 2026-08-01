resource "aws_security_group" "bastion" {

  name   = "bastion-security-group-${var.environment}"
  vpc_id = aws_vpc.main.id

  ingress {
    description = "SSH from my IP"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = [
      "${var.my_ip}/32"
    ]
  }

  egress {
    from_port = 0
    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "bastion-security-group-${var.environment}"
    }
  )
}