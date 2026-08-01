resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.2.0/24"

  availability_zone = "eu-west-3a"

  tags = merge(
    local.common_tags,
    {
      Name = "private-subnet-${var.environment}"
    }
  )
}