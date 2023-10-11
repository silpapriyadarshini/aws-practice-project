module "pub_subnet" {
    source      = "./modules/subnet"

    vpc_id     = aws_vpc.my_vpc.id
    subnet_cidr = var.pub_subnet_cidr
    subnet_name = var.pub_subnet_name
    az_name     = var.az1
}

module "pri_subnet1" {
    source      = "./modules/subnet"

    vpc_id     = aws_vpc.my_vpc.id
    subnet_cidr = var.pri_subnet1_cidr
    subnet_name = var.pri_subnet1_name
    az_name     = var.az1
}

module "pri_subnet2" {
    source      = "./modules/subnet"

    vpc_id     = aws_vpc.my_vpc.id
    subnet_cidr = var.pri_subnet2_cidr
    subnet_name = var.pri_subnet2_name
    az_name     = var.az2
}
