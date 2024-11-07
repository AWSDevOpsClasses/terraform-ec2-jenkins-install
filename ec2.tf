# Data Resource Block for ami-id
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["amazon"]
  filter {
    name = "name"
#    values = [ "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516" ]
    values = [ "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240927" ]
  }
}

# Ec2 resource for Ubuntu Server
resource "aws_instance" "jenkins" {
#  ami           = "ami-0866a3c8686eaeeba"
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  key_name      = "nvirginia-devops"
  count = 1
/*  vpc_security_group_ids = [
    "sg-012f058de412a1366"
  ] */
  vpc_security_group_ids = ["${aws_security_group.jenkinssg.id}"]
   
   #USERDATA in AWS EC2 using Terraform
#  user_data = file("userdata-jenkins.sh")
#  user_data = "${file("userdata-jenkins.sh")}"
#  user_data = file("${path.module}/userdata-jenkins.sh")
  subnet_id = "subnet-0f7f1a84a20b5d114"
  user_data = templatefile("user_data/userdata-jenkins.sh",
    {
      ServerName = var.ServerName
  })
  tags = {
    Name = "${var.prefix}${count.index}"
  }

}
