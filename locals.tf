locals {
  ssh_port       = 22
  jenkins_port   = 8080
#  inbound_ports  = [22, 8080]
#  outbound_ports = [0]
}

/*locals {
   ingress_rules = [{
      port        = 8080
      description = "Ingress rules for jenkins port 8080"
   },
   {
      port        = 22
      description = "Ingree rules for ssh port 22"
   }]
} */
