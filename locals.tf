locals {
  common_tags = {
    Project     = "aws-terraform-learning"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}