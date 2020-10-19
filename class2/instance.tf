resource "aws_instance" "web" {
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  key_name = "${aws_key_pair.class.key_name}"
}

resource "aws_key_pair" "class" {
  key_name   = "class-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
