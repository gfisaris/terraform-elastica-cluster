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

resource "aws_security_group" "sg-ec2-elb-pubAccess" {
	name = "VPC:SG:EC2:ELB:PublicAccess"
	description = "Control Public Access to EC2-ELB"

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
