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

ami_id = "ami-04e601abe3e1a910f"
instance-type = "t2.micro"
key_name = "migration-key"
instance_tag = "public"
