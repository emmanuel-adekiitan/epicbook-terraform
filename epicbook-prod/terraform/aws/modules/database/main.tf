
resource "aws_db_subnet_group" "main" {
  name = "epicbook-db-subnet-group"
  # Change this to accept the list
  subnet_ids = var.private_subnet_ids

  tags = { Name = "EpicBook DB subnet group" }
}

resource "aws_db_instance" "mysql" {
  allocated_storage      = 20
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  db_name                = "epicbookdb"
  username               = "admin"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.rds_sg_id]
  publicly_accessible    = false
  skip_final_snapshot    = true
}


resource "local_file" "ansible_vars" {
  content  = "db_host: \"${aws_db_instance.mysql.address}\"\n"
  
  # Use the absolute path from your 'ls' command earlier
  filename = "/Users/emmanueladekiitan/Terraform-Project/epicbook-terraform/epicbook-prod/ansible/group_vars/db_vars.yml"
}
