resource "aws_security_group" "terraform-sg-ec2-pubAccess" {
	name = "VPC:SG:EC2:PublicAccess"
	description = "Control Public Access to Terraform created EC2 Instances"

	ingress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}
