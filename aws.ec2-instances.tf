resource "aws_instance" "terraform-ec2_instance-X" {
	ami			= "ami-7abd0209"
	instance_type		= "t2.micro"
	
	key_name		= "${aws_key_pair.gfisaris.key_name}"

	tags {
		"Name"		= "TerraForm Node X"
	}
}
