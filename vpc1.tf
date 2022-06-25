resource "aws_vpc" "PROJECT1-DEVOPS" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "PROJECT1-DEVOPS"

  }
}
# PUBLIC SUBNET
resource "aws_subnet" "MY-PUBLIC-SUBNET1" {
  vpc_id     = aws_vpc.PROJECT1-DEVOPS.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "MY-PUBLIC-SUBNET1"
  }
}
# PUBLIC SUBNET 
resource "aws_subnet" "MY-PUBLIC-SUBNET2" {
  vpc_id     = aws_vpc.PROJECT1-DEVOPS.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "MY-PUBLIC-SUBNET2"
  }
}
# PRIVATE SUBNET
resource "aws_subnet" "MY-PRIVATE-SUBNET1" {
  vpc_id     = aws_vpc.PROJECT1-DEVOPS.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "MY-PRIVATE-SUBNET1"
  }
}
# PRIVATE SUBNET 
resource "aws_subnet" "MY-PRIVATE-SUBNET2" {
  vpc_id     = aws_vpc.PROJECT1-DEVOPS.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "MY-PRIVATE-SUBNET2"
  }
}
# PUBLIC ROUTE 
resource "aws_route_table" "PUBLIC-ROUTE-TABLE" {
  vpc_id = aws_vpc.PROJECT1-DEVOPS.id

  tags = {
    Name = "PUBLIC-ROUTE-TABLE"
  }
}
# PRIVATE ROUTE 
resource "aws_route_table" "PRIVATE-ROUTE-TABLE" {
  vpc_id = aws_vpc.PROJECT1-DEVOPS.id

  tags = {
    Name = "PRIVATE-ROUTE-TABLE"
  }
}
# PUBLIC ROUTE TABLE ASSOCIATION 
resource "aws_route_table_association" "PUBLIC-ROUTE-1-ASSOCIATION" {
  subnet_id      = aws_subnet.MY-PUBLIC-SUBNET1.id
  route_table_id = aws_route_table.PUBLIC-ROUTE-TABLE.id
}
# PUBLIC ROUTE TABLE ASSOCIATION 
resource "aws_route_table_association" "PUBLIC-ROUTE-2-ASSOCIATION" {
  subnet_id      = aws_subnet.MY-PUBLIC-SUBNET2.id
  route_table_id = aws_route_table.PUBLIC-ROUTE-TABLE.id
}
# PRIVATE ROUTE TABLE ASSOCIATION 
resource "aws_route_table_association" "PRIVATE-ROUTE-1-ASSOCIATION" {
  subnet_id      = aws_subnet.MY-PRIVATE-SUBNET1.id
  route_table_id = aws_route_table.PRIVATE-ROUTE-TABLE.id
}
# PRIVATE ROUTE TABLE ASSOCIATION 
resource "aws_route_table_association" "PRIVATE-ROUTE-2-ASSOCIATION" {
  subnet_id      = aws_subnet.MY-PRIVATE-SUBNET2.id
  route_table_id = aws_route_table.PRIVATE-ROUTE-TABLE.id
}
# INTERNET GATEWAY
resource "aws_internet_gateway" "PROJECT1-IGW" {
  vpc_id = aws_vpc.PROJECT1-DEVOPS.id

  tags = {
    Name = "PROJECT1-IGW"
  }
}
# ROUTE
resource "aws_route" "IGW-route" {
  route_table_id            = aws_route_table.PUBLIC-ROUTE-TABLE.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.PROJECT1-IGW.id
 
  }
