output "vpc_id" {
    description = "This is the id of vpc"
    value       = aws_vpc.my_vpc.id
}