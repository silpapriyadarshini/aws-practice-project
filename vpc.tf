module "my_vpc1"{
    source = "./modules/vpc"
    
    vpc_cidr  = var.vpc1_cidr
    vpc_name  = var.vpc1_name

}