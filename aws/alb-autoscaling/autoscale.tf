resource "aws_launch_configuration" "autoscale_launch" {
  image_id = "${lookup(var.aws_amis, var.aws_region)}"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.sec_web.id}"]
  key_name = "${aws_key_pair.auth.id}"
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get -y update
              sudo apt-get -y install nginx
              
              EOF
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "autoscale_group" {
  launch_configuration = "${aws_launch_configuration.autoscale_launch.id}"
  vpc_zone_identifier = ["${aws_subnet.PrivateSubnetA.id}","${aws_subnet.PrivateSubnetB.id}","${aws_subnet.PrivateSubnetC.id}"]
  load_balancers = ["${aws_elb.elb.name}"]
  min_size = 3
  max_size = 3
  tag {
    key = "Name"
    value = "autoscale"
    propagate_at_launch = true
  }
}