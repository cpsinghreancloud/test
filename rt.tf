# Define the route table
resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "Public Subnet RT"
  }
}
resource "aws_route_table" "private-rt" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat.id}"
  }

  tags {
    Name = "Private Subnet RT"
  }
}
resource "aws_nat_gateway" "nat" {
    allocation_id = "${aws_eip.test_eip.id}"
    subnet_id = "${aws_subnet.public-subnet.id}"
    depends_on = ["aws_internet_gateway.gw"]
}
resource "aws_main_route_table_association" "main-rt" {
  vpc_id         = "${aws_vpc.default.id}"
  route_table_id = "${aws_route_table.private-rt.id}"
}
