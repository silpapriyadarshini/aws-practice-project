module "public-ec2"{
    source = "./modules/instance"

    vpc_id              = aws_vpc.my_vpc.id
    ec2_subnet          = module.pub_subnet.subnet_id
    ami_id              = var.ami_id
    ec2_instance_type   = var.instance-type
    ec2_key             = var.key_name
    ec2_tag             = var.instance_tag
}