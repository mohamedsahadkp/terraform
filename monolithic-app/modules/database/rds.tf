resource "random_password" "master_password" {
  length  = 32
  special = false
}

resource "aws_db_instance" "rds_instance" {
  identifier = "${var.project_name}-${var.project_environment}-rds-instance"

  instance_class    = var.database.instance_class
  engine            = var.database.engine
  port              = var.database.port
  engine_version    = var.database.engine_version
  allocated_storage = var.database.allocated_storage

  name     = var.database.name
  username = var.database.username
  password = random_password.master_password.result

  vpc_security_group_ids = [aws_security_group.db_security_group.id]

  deletion_protection       = var.database.deletion_protection
  backup_retention_period   = var.database.backup_retention_period
  skip_final_snapshot       = var.database.skip_final_snapshot
  final_snapshot_identifier = var.database.final_snapshot_identifier
  copy_tags_to_snapshot     = var.database.copy_tags_to_snapshot
  parameter_group_name      = var.database.parameter_group_name
  publicly_accessible       = var.database.publicly_accessible

  tags = merge(
    var.resource_tags, map("Name", "${var.project_name}-${var.project_environment}-rds-instance")
  )
}
