resource "aws_instance" "terraform-ec2_instance-X" {
	ami			= "ami-7abd0209"
	instance_type		= "t2.micro"

	tags {
		"Name"		= "TerraForm Node X"
	}
}
