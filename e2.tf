module "public-ec2"{
    source = "./modules/instance"

    vpc_id              = aws_vpc.my_vpc.id
    ec2_subnet          = module.pub_subnet.subnet_id
    ami_id              = var.ami_id
    ec2_instance_type   = var.instance-type
    ec2_key             = var.key_name
    ec2_tag             = var.instance_tag
    instance_profile    = aws_iam_instance_profile.ec2_cw_agent.name
    ec2_user_data       = local.userdata
    ec2_securitygroup   = aws_security_group.pub_ec2_sg.id
}

resource "aws_eip" "public_ec2_eip" {
  instance = module.public-ec2.instance-id
  vpc = true
}