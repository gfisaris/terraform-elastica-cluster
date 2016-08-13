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
		user = "centos"
		key_file = "${var.ssh_key_path}"
	}

	provisioner "remote-exec" {
		inline = [
			"touch ~/TerraForm.hello",
			"ls -all ~/"
		]
	}

}
