resource "aws_instance" "tomcat" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t3.medium"
  key_name      = "nvirginia-devops"
  count = 1
  vpc_security_group_ids = [
    "sg-0a4aad1f3fd186745"
  ]
  subnet_id = "subnet-0f7f1a84a20b5d114"
  tags = {
    Name = "${var.prefix}${count.index}"
  }
  
#USERDATA in AWS EC2 using Terraform
  user_data = file("userdata-tomcat.sh") 

}