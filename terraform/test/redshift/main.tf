# Configure cloud provider
provider "aws" {
  region = "us-east-2"
}

# Configure Redshift VPC
resource "aws_vpc" "redshift_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Redshift VPC"
  }
}

# Configure subnet
resource "aws_subnet" "redshift_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.redshift_vpc.id

  tags = {
    Name = "Redshift Subnet"
  }
}

# Configure the gateway and annex it to the VPC
resource "aws_internet_gateway" "redshift_igw" {
  vpc_id = aws_vpc.redshift_vpc.id

  tags = {
    Name = "Redshift Internet Gateway"
  }
}

# Configure the route table
resource "aws_route_table" "redshift_route_table" {
  vpc_id = aws_vpc.redshift_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.redshift_igw.id
  }

  tags = {
    Name = "Redshift Route Table"
  }
}


# Associate the route table with the subnet
resource "aws_route_table_association" "redshift_route_table_association" {
  subnet_id      = aws_subnet.redshift_subnet.id
  route_table_id = aws_route_table.redshift_route_table.id
}

# Configure the security group
resource "aws_security_group" "redshift_sg" {
  name        = "redshift_sg"
  description = "Allow Redshift traffic"
  vpc_id      = aws_vpc.redshift_vpc.id

  ingress {
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Redshift Security Group"
  }
}

# Configure the subnet group
resource "aws_redshift_subnet_group" "redshift_subnet_group" {
  name       = "redshift-subnet-group"
  subnet_ids = [aws_subnet.redshift_subnet.id]

  tags = {
    Name = "Redshift Subnet Group"
  }
}

# Configure the Redshift cluster
resource "aws_redshift_cluster" "redshift_cluster" {
  cluster_identifier = "redshift-cluster"
  database_name      = "dsadb"
  master_username    = "adminuser"
  master_password    = "dsaSecurePassw0rd!"
  node_type          = "dc2.large"
  number_of_nodes    = 1

  vpc_security_group_ids    = [aws_security_group.redshift_sg.id]
  cluster_subnet_group_name = aws_redshift_subnet_group.redshift_subnet_group.name

  skip_final_snapshot = true
}
