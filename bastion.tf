resource "aws_instance" "bastion" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.bastion.id
  ]

  key_name = aws_key_pair.deployer.key_name


  tags = merge(
    local.common_tags,
    {
      Name = "bastion-${var.environment}"
    }
  )
}