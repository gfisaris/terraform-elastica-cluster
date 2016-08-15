resource "aws_instance" "terraform-ec2_instance-X" {
	count           = "${var.es_cluster_size}"
	ami		= "${lookup(var.aws_amis, var.aws_region)}"
	instance_type	= "t2.micro"
	
	key_name		= "${aws_key_pair.elasticaEC2Admin.key_name}"
	vpc_security_group_ids	= ["${aws_security_group.sg-ec2-instances-elastica.id}"]

	root_block_device {
		volume_type		= "gp2"
		volume_size		= 10
		delete_on_termination	= true
	}

	user_data = "${template_file.elastica-cluster.rendered}"

	tags {
		"Name"		= "${var.es_cluster_name}-node${count.index}"
		"es_cluster"	= "${var.es_cluster_name}"
	}

	connection {
		type = "ssh"
		host = "${self.public_ip}"
		user = "centos"
		private_key = "${file("${var.key_path}")}"
		agent = "false"
		timeout = "60s"
	}

	lifecycle {
		create_before_destroy = true
	}
}
