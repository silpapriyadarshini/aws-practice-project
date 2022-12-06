resource "aws_vpc" "vpc_lab" {
    cidr_block  = var.vpc_cidr
    instance_tenancy = "default"
    tags = {
        Name    = var.vpc_name
    }
}