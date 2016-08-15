resource "template_file" "elastica-cluster" {
  template = "${file("${path.module}/aws.ec2-userdata.txt")}"

  vars {
    aws_access_key = "${var.aws_access_key}"
    aws_secret_key = "${var.aws_secret_key}"
    aws_region = "${var.aws_region}"
    aws_vpc_security_groups = "${aws_security_group.sg-ec2-instances-elastica.id}"
    es_cluster_name = "${var.es_cluster_name}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
