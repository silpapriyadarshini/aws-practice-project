variable "vpc_name" {
  description = "This is the name/tag of vpc"
}

variable "vpc_cidr" {
  description = "This is the CIDR of VPC"
}

# variable "vpc1_cidr" {
#   description = "This is the CIDR block of VPC"
# }

# variable "vpc1_name" {
#   description = "This is the name of VPC"
# }

variable "pub_subnet_cidr" {
  description = "This is the CIDR block of public subnet"
}

variable "app_subnet_cidr" {
  description = "This is the CIDR block of 1st private subnet"
}

variable "db_subnet_cidr" {
  description = "This is the CIDR block of 2nd private subnet"
}

variable "pub_subnet_name" {
  description = "This is the name of public subnet"
}

variable "app_subnet_name" {
  description = "This is the name of 1st private subnet"
}

variable "db_subnet_name" {
  description = "This is the name of 2nd private subent"
}

variable "az1" {
  description = "This is the name of 1st availability zone"
}

variable "az2" {
  description = "This is the name of 2nd availability zone"
}

variable "ami_id" {
  description = "This is ami id used for ubuntu instance in eu-central-1"
}

variable "instance-type" {
  description = "This is instance type used for ubuntu instance in eu-central-1"
}

variable "key_name" {
  description = "This is key pair used for ubuntu instance in eu-central-1"
}

variable "instance_tag" {
  description = "This is tag name used for ubuntu instance in eu-central-1"
}



