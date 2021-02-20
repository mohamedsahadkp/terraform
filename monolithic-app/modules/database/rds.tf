# Create randon strong password database
resource "random_password" "master_password" {
  length  = 32
  special = false
}

resource "aws_db_instance" "rds_instance" {
  identifier = "${var.project.name}-${var.project.environment}-rds"

  instance_class    = var.database.rds.instance_class
  engine            = var.database.rds.engine
  port              = var.database.rds.port
  engine_version    = var.database.rds.engine_version
  allocated_storage = var.database.rds.allocated_storage

  name     = var.database.rds.name
  username = var.database.rds.username
  password = random_password.master_password.result

  vpc_security_group_ids = [aws_security_group.rds_security_group.id]

  deletion_protection       = var.database.rds.deletion_protection
  backup_retention_period   = var.database.rds.backup_retention_period
  skip_final_snapshot       = var.database.rds.skip_final_snapshot
  final_snapshot_identifier = var.database.rds.final_snapshot_identifier
  copy_tags_to_snapshot     = var.database.rds.copy_tags_to_snapshot
  parameter_group_name      = var.database.rds.parameter_group_name
  publicly_accessible       = var.database.rds.publicly_accessible

  tags = merge(
    var.project.resource_tags, map("Name", "${var.project.name}-${var.project.environment}-rds")
  )
}
