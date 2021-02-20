resource "aws_lb" "alb" {
  name               = "${var.project.name}-${var.project.environment}-api-server-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]
  subnets            = aws_subnet.public.*.id

  enable_deletion_protection = true

  # access_logs {
  #   bucket  = aws_s3_bucket.<bucket-name>.bucket
  #   prefix  = "api-server-alb"
  #   enabled = true
  # }

  tags = merge(
    var.project.resource_tags, map("Name", "${var.project.name}-${var.project.environment}-api-server-alb")
  )
}
