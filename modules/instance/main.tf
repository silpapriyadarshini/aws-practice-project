resource "aws_instance" "ec2-instance" {
  
  subnet_id       = var.ec2_subnet  
  ami             = var.ami_id
  instance_type   = var.ec2_instance_type
  security_groups = [aws_security_group.pub_ec2_sg.id]
  key_name        = var.ec2_key
  user_data       = var.ec2_user_data
  iam_instance_profile = var.instance_profile

  tags = {
    Name    = join("-",["terraform",var.ec2_tag])
  }
}


resource "aws_security_group" "pub_ec2_sg" {
  name        = "secutiry_group_ec2"
  description = "Allow SSH, HTTP and HTTPS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    # cidr_blocks      = ["223.186.17.45/32"]
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    # cidr_blocks      = ["223.186.17.45/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg-ec2"
  }
}