output "private_ip" {
  value       = "${aws_instance.jenkins.*.private_ip}"
  description = "PrivateIP address details"
} 

output "public_ip" {
  value       = "${aws_instance.jenkins.*.public_ip}"
  description = "PrivateIP address details"
}  
