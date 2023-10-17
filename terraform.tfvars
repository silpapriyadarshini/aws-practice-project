# region           = "eu-west-1"
az1 = "eu-central-1a"
az2 = "eu-central-1b"

vpc_name = "vpc1"
vpc_cidr = "192.168.0.0/16"

pub_subnet_cidr = "192.168.6.0/24"
pub_subnet_name = "public-subnet"

app_subnet_cidr = "192.168.7.0/24"
app_subnet_name = "app_subnet"

db_subnet_cidr = "192.168.8.0/24"
db_subnet_name = "db_subnet"

ami_id = "ami-0427a796a4e582276"    # amzn2-ami-kernel-5.10-hvm-2.0.20230926.0-x86_64-gp2
instance-type = "t2.micro"
key_name = "migration-key"
instance_tag = "public"
