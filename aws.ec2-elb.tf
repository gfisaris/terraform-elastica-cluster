resource "aws_elb" "ec2_elb-Elastica" {
  name = "ec2-elb-Elastica"
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  listener {
    instance_port = 9200
    instance_protocol = "http"
    lb_port = 9200
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 3
    unhealthy_threshold = 2
    timeout = 2
    target = "HTTP:9200/"
    interval = 5
  }

  cross_zone_load_balancing = true
  idle_timeout = 300
  connection_draining = true
  connection_draining_timeout = 300

  security_groups = ["${aws_security_group.sg-ec2-elb-pubAccess.id}","${aws_security_group.sg-ec2-elb-elastica.id}"]

  tags {
    Name = "ec2-elb-Elastica"
  }
}
