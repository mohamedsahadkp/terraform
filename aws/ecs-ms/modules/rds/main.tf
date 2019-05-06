resource "aws_db_subnet_group" "tf_db_subnet_group" {
  name        = "${var.project_name}-${var.project_environment}-db-subnet-group"
  subnet_ids  = ["${var.public_subnet_1a}", "${var.public_subnet_1a}"]
}

resource "aws_security_group" "tf_security_group" {
  name        = "${var.project_name}-${var.project_environment}-rds-sg"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Project = "${var.project_name}"
    Environment = "${var.project_environment}"
  }
}

resource "aws_db_instance" "tf_db_instance" {
  depends_on             = ["aws_security_group.tf_security_group"]

  allocated_storage      = "${var.rds_storage}"
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "9.5.4"
  instance_class         = "db.t2.micro"
  name                   = "${var.project_name}-${var.project_environment}-db"
  username               = "${var.rds_username}"
  password               =  "${var.rds_password}"
  parameter_group_name   = "default.mysql5.7"
  publicly_accessible      = true
  backup_retention_period  = 7
  port                     = "${var.rds_port}"
  multi_az                 = false

  vpc_security_group_ids = ["${aws_security_group.tf_security_group.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.tf_db_subnet_group.id}"
}

