resource "aws_vpc" "vpc_mod" {
    cidr_block          = var.vpc_cidr
    instance_tenancy    = "default"
    
    tags = {
        Name    = join("-",["terraform",var.vpc_name])
    }
}