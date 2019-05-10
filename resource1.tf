# Define webserver inside the public subnet
resource "aws_instance" "webserver" {
   ami  = "${var.ami}"
   instance_type = "t2.micro" 
   subnet_id = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("install.sh")}"
   key_name = "testkey"
tags {
    Name = "webserver"
  }
}
