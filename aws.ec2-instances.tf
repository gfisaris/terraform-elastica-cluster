resource "aws_instance" "terraform-ec2_instance-X" {
	ami			= "ami-7abd0209"
	instance_type		= "t2.micro"
	
	key_name		= "${aws_key_pair.gfisaris.key_name}"
	vpc_security_group_ids	= ["${aws_security_group.terraform-sg-ec2-pubAccess.id}"]

	root_block_device {
		volume_type		= "gp2"
		volume_size		= 10
		delete_on_termination	= true
	}

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
			"sudo yum clean all",
			"sudo yum update -y"
		]
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

}
