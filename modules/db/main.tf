resource "aws_db_instance" "drug_mysql_db" {
  allocated_storage      = 10
  db_name                = "drugstocDB"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = var.db_instance_type
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  vpc_security_group_ids = var.security_group_ids
}