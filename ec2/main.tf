resource "aws_instance" "k8s-workers" {
  ami = "ami-06aa3f7caf3a30282"
  instance_type = "t3.medium"
  key_name = "aws-server"
  count = 2
  subnet_id = var.private_subnet_1a
  vpc_security_group_ids = [ var.security_group_id ]
  tags = {
    "Name" : "K8S"
    "Type" : "Workers"
  }
}

resource "aws_instance" "k8s-master" {
  ami = "ami-06aa3f7caf3a30282"
  instance_type = "t3.medium"
  key_name = "aws-server"
  count = 1
  subnet_id = var.public_subnet_1b
  vpc_security_group_ids = [ var.security_group_id ]
  associate_public_ip_address = true
  tags = {
    "Name" : "K8S"
    "Type" : "Master"
  }

}

resource "aws_instance" "Ansible" {
  ami = "ami-06aa3f7caf3a30282"
  instance_type = "t2.micro"
  key_name = "aws-server"
  count = 1
  subnet_id = var.public_subnet_1a
  vpc_security_group_ids = [ var.security_group_id ]
  associate_public_ip_address = true
  tags = {
    "Name" : "Ansible"
  }
}
