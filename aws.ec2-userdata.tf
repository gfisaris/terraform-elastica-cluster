resource "template_file" "elastica-cluster" {
  template = "${file("${path.module}/aws.ec2-userdata.txt")}"

  vars {
    aws_access_key = "${var.aws_access_key}"
    aws_secret_key = "${var.aws_secret_key}"
    aws_region = "${var.aws_region}"
    aws_vpc_security_groups = "${aws_security_group.sg-ec2-instances-elastica.id}"
    es_cluster_name = "${var.es_cluster_name}"
    es_cluster_minimum_master_nodes = "${format("%d", (var.es_cluster_size / 2) + 1)}"
    es_cluster_numver_of_shards	= "${(var.es_cluster_size * 2) - 1}"
    es_cluster_number_of_replicas = "${var.es_cluster_size - 1}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
