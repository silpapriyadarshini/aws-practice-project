variable "ami_id" {
  description = "This is the AMI id for ubuntu in eu-central-1"
}

variable "ec2_instance_type" {
  description = "This is the instance type in eu-central-1"
}

variable "ec2_key" {
    description = "Key pair used for ec2 instances"
}

variable "ec2_tag" {
    description = "tag name used for ec2 instances"
    type = string
}

variable "ec2_subnet" {
    description = "Subnet ID used for ec2 instances"
}

variable "vpc_id" {
    description = "VPC ID used for ec2 instances"
}

variable "ec2_user_data" {
    description = "User data used for ec2 instances"
}

variable "instance_profile" {
    description = "Instance profile attched to ec2 instances"
}

variable "ec2_securitygroup" {
    description = "Instance profile attched to ec2 instances"
}
