resource "aws_subnet" "subnet_mod" {
    vpc_id              = var.vpc_id
    cidr_block          = var.subnet_cidr
    availability_zone   = var.az_name
    
    tags = {
        Name = var.subnet_name
    }
}
