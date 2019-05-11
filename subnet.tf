# Define the public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"

  tags {
    Name = "Web Public Subnet"
  }
}

# Define the private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "us-east-1a"
  tags {
    Name = "Kubernetes Private Subnet"
  }
}
# Assign the route table to the private Subnet
resource "aws_route_table_association" "private-rt-ass" {
  subnet_id = "${aws_subnet.private-subnet.id}"
  route_table_id = "${aws_route_table.private-rt.id}"
}
# Assign the route table to the public Subnet
resource "aws_route_table_association" "web-public-rt-ass" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}
variable "default_tags" {
  description = "Default tags for all resources"
  type = "map"
  default = {
    "Terraform" = "terraform"
  }
}
