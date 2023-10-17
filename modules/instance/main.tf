resource "aws_instance" "ec2-instance" {
  
  subnet_id       = var.ec2_subnet  
  ami             = var.ami_id
  instance_type   = var.ec2_instance_type
  security_groups = [var.ec2_securitygroup]
  key_name        = var.ec2_key
  user_data       = var.ec2_user_data
  iam_instance_profile = var.instance_profile

  tags = {
    Name    = join("-",["terraform",var.ec2_tag])
  }
}