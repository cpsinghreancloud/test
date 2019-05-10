# Define the security group for public subnet

resource "aws_security_group" "kubectl" {
  name = "kub-access"
  description = "Allow incoming HTTP connections & SSH access"

ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["172.31.0.0/16"]
  }
  egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  }  
vpc_id="${aws_vpc.default.id}"

  tags {
    Name = "Kubernetes SG"
  }
}

