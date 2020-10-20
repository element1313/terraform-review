resource "aws_instance" "web" {
    #count = 10
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  key_name = "${aws_key_pair.class.key_name}"
  user_data =  "${file("userdata.sh")}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  availability_zone = "us-east-1a"

  tags = {
    Name = "HelloWorld"
    Env = "Development"
    Client = "panera_bread"
    Team = "DevOps"
    Created_by = "Shokhrukh"
  }

}

resource "aws_instance" "web2" {
   ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
    Env = "Development"
    Client = "panera_bread"
    Team = "DevOps"
    Created_by = "Shokhrukh"
  }

}