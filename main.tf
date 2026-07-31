resource "aws_instance" "my_server" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id
  ]

  user_data = file("user_data.sh")

  tags = merge(
    local.common_tags,
    {
      Name = "nginx-server-${var.environment}"
    }
  )
}