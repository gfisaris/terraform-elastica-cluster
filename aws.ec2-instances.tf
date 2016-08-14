resource "aws_instance" "terraform-ec2_instance-X" {
	ami		= "${lookup(var.aws_amis, var.aws_region)}"
	instance_type	= "t2.micro"
	
	key_name		= "${aws_key_pair.elasticaEC2Admin.key_name}"
	vpc_security_group_ids	= ["${aws_security_group.sg-ec2-instances-elastica.id}"]

	root_block_device {
		volume_type		= "gp2"
		volume_size		= 10
		delete_on_termination	= true
	}

	user_data = "${file("ec2-instance_userdata.sh")}"

	tags {
		"Name"		= "TerraForm Node X"
	}

	connection {
		type = "ssh"
		host = "${self.public_ip}"
		user = "centos"
		private_key = "${file("${path.module}/${var.key_path}")}"
		agent = "false"
		timeout = "60s"
	}
	
	provisioner "remote-exec" {
		inline = [
			"sudo mkdir -p /terraform/provisioning.scripts/",
			"sudo chown -R centos:centos /terraform"
		]
	}
	
	provisioner "file" {
		source = "provisioning.scripts/"
		destination = "/terraform/provisioning.scripts/"
	}
	
	provisioner "remote-exec" {
		inline = [
			"sudo bash /terraform/provisioning.scripts/execute-initialization.cmds.sh",
			"sudo bash /terraform/provisioning.scripts/execute-configuration.cmds.sh"
		]
	}

	provisioner "local-exec" {
		command = "curl -X GET 'http://${aws_elb.ec2_elb-Elastica.dns_name}:9200'"
	}

}
