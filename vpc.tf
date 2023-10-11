#Not working
# module "my_vpc"{
#     source = "./modules/vpc"
    
#     vpc_cidr  = var.vpc_cidr
#     vpc_name  = var.vpc_name
# }

resource "aws_vpc" "my_vpc" {
    cidr_block          = var.vpc_cidr
    instance_tenancy    = "default"
    
    tags = {
        Name    = join("-",["terraform",var.vpc_name])
    }
}