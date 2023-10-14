output "vpc_id" {
  description = "This is my VPC id"
  value       = aws_vpc.my_vpc.id
}

output "public_ec2_id" {
  description = "This is my ec2 instance ID for public subnet"
  value       = module.public-ec2.instance-id
}

