resource "aws_vpc" "app-vpc" {
  cidr_block = "10.0.0.0/21"

  tags = {
    Name = "app-vpc"
  }
}

resource "aws_subnet" "app-pubsubnet" {
  vpc_id            = aws_vpc.app-vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "app-subnet"
  }
}

resource "aws_internet_gateway" "app-igw" {
  vpc_id = aws_vpc.app-vpc.id

  tags = {
    Name = "app-igw"
  }
}

resource "aws_route_table" "app-rt" {
  vpc_id = aws_vpc.app-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app-igw.id
  }

  tags = {
    Name = "app-RT"
  }
}

resource "aws_route_table_association" "app-rt-association" {
  subnet_id      = aws_subnet.app-pubsubnet.id
  route_table_id = aws_route_table.app-rt.id
}