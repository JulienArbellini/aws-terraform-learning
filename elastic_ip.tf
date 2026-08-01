resource "aws_eip" "my_server" {
  instance = aws_instance.my_server.id
  domain   = "vpc"
  tags = merge(
    local.common_tags,
    {
      Name = "nginx-eip-${var.environment}"
    }
  )
}