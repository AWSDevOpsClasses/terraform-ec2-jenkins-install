output "private_ip" {
  value       = "${aws_instance.jenkins.*.private_ip}"
  description = "PrivateIP address details"
} 

output "public_ip" {
  value       = "${aws_instance.jenkins.*.public_ip}"
  description = "PrivateIP address details"
}  

output "ami_id" {
  value       = "${data.aws_ami.ubuntu.*.id}"
  description = "AMI ID depends on the instance type and region in which you're launching your stack. And IDs can change regularly, such as when an AMI is updated with software updates."
}

output "sg_id" {
  value       = "${aws_security_group.jenkinssg.*.id}"
  description = "SecurityGroup ID"
}
