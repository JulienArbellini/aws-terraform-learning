resource "aws_instance" "private_server" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id = aws_subnet.private.id

  vpc_security_group_ids = [
    aws_security_group.private.id
  ]

  tags = merge(
    local.common_tags,
    {
      Name = "private-server-${var.environment}"
    }
  )
}