# Security group resource for Ubuntu server
resource "aws_security_group" "jenkinssg" {
  name                = "jenkins-SG"
  description         = "Security Group for Jenkins Server"
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = "ssh"
     from_port        = 22
#     from_port        = local.ssh_port
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
  #   to_port          = 22
     to_port          = local.ssh_port
   },
  #]
  #ingress                = 
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = "jenkins"
#     from_port        = 8080
     from_port        = local.jenkins_port
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
#     to_port          = 8080
     to_port          = local.jenkins_port
   },
  ]
/*  tags = {
  Name = “name_security_group” 
  } */
}
