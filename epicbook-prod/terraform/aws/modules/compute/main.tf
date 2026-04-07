# 1. Create a NEW key pair in AWS using your existing RSA file
resource "aws_key_pair" "ansible_key" {
  key_name   = "epicbook-ansible-key" # Give it a unique name
  public_key = file(pathexpand("~/.ssh/id_ansible_rsa.pub"))
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0da9ffeb885463685" # Ubuntu 22.04 LTS
  instance_type          = "t3.micro"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.web_sg_id]
  key_name      = var.key_name  # This now receives "epicbook-deployer"
  tags = { Name = "epicbook-vm" }
}