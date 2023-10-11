module "pub_subnet" {
  source = "./modules/subnet"

  vpc_id      = aws_vpc.my_vpc.id
  subnet_cidr = var.pub_subnet_cidr
  subnet_name = var.pub_subnet_name
  az_name     = var.az1
}

module "app_subnet" {
  source = "./modules/subnet"

  vpc_id      = aws_vpc.my_vpc.id
  subnet_cidr = var.app_subnet_cidr
  subnet_name = var.app_subnet_name
  az_name     = var.az1
}

module "db_subnet" {
  source = "./modules/subnet"

  vpc_id      = aws_vpc.my_vpc.id
  subnet_cidr = var.db_subnet_cidr
  subnet_name = var.db_subnet_name
  az_name     = var.az2
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "igw"
  }
}

resource "aws_nat_gateway" "pri_nat_gw" {
  subnet_id     = module.pub_subnet.subnet_id
  allocation_id     = aws_eip.nat_eip.id
  tags = {
    Name = "pri-NAT-gw"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "igw_routetable" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "igw-route-table"
  }
}

resource "aws_route_table" "nat_routetable" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.pri_nat_gw.id
  }

  tags = {
    Name = "nat-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = module.pub_subnet.subnet_id
  route_table_id = aws_route_table.igw_routetable.id
}

resource "aws_route_table_association" "applicatione" {
  subnet_id      = module.app_subnet.subnet_id
  route_table_id = aws_route_table.nat_routetable.id
}

resource "aws_route_table_association" "pub_route" {
  subnet_id      = module.db_subnet.subnet_id
  route_table_id = aws_route_table.nat_routetable.id
}
