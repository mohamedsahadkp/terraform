resource "aws_autoscaling_group" "tf_asg" {
    name                        = "${var.project_name}-${var.project_env}-asg"
    max_size                    = "${var.max_instance_size}"
    min_size                    = "${var.min_instance_size}"
    desired_capacity            = "${var.desired_capacity}"
    vpc_zone_identifier         = ["${aws_subnet.tf_public_sn_01.id}", "${aws_subnet.tf_public_sn_02.id}"]
    launch_configuration        = "${aws_launch_configuration.tf_lc.name}"
    health_check_type           = "ELB"
  }