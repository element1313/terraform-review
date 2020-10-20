output "IP" {
    value = "${aws_instance.web.public_ip}"
}
output "ID" {
    value = "${aws_instance.web.id}"
}
output "PIP" {
    value = "${aws_instance.web.private_ip}"
}
output "key" {
    value = "${aws_instance.web.key_name}"
}