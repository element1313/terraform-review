resource "aws_instance" "web" {
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.class.key_name}"
  vpc_security_group_ids = ["${aws_security_group.provisioner.id}"]

# Push files to remote server
  provisioner "file" {
    connection {
    host = "${self.public_ip}"
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("~/.ssh/id_rsa")}"
  }
  
  source = "r1soft.repo"
  destination = "/tmp/r1soft.repo"
  }


# Execute linux commands on Remote Machine
  provisioner "remote-exec" {
    connection {
    host = "${self.public_ip}"
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("~/.ssh/id_rsa")}"
  }


  inline = [
    "sudo yum install -y epel-release ",
     "sudo yum install -y httpd ",
     "sudo systemctl start httpd",
     "sudo systemctl enable httpd",
     "sudo cp /tmp/r1soft.repo  /etc/yum.repos.d/r1soft.repo"

  ]
  }
}
