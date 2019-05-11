resource "aws_eip" "test_eip" {
  vpc      = true
  depends_on = ["aws_internet_gateway.gw"]
}
resource "aws_eip" "web_eip" {
  vpc      = true
  instance = "${aws_instance.webserver.id}"
  depends_on = ["aws_internet_gateway.gw"]
}
