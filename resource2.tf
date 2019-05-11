# Define kubernetes inside the private subnet
resource "aws_instance" "kubernetes" {
   ami  = "${var.ami}"
   instance_type = "t2.micro"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = false
   source_dest_check = false
   user_data = "${file("install1.sh")}"
   key_name = "testkey"
tags {
    Name = "kubernetes"
  }
}
