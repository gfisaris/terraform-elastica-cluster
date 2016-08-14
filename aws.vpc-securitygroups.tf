resource "aws_security_group" "sg-ec2-instances-elastica" {
	name = "VPC:SG:EC2:Instances:ElasticaNodes"
	description = "Security Group attached to Elastica EC2 Instances"

	ingress {
		from_port = 9200
		to_port = 9200
		protocol = "tcp"
		security_groups = ["${aws_security_group.sg-ec2-elb-elastica.id}"]
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
		from_port = 9200
		to_port = 9200
		protocol = "tcp"
		cidr_blocks = ["${var.myip_cidr_block}"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_security_group" "sg-ec2-elb-elastica" {
	name = "VPC:SG:EC2:ELB:Elastica"
	description = "Security Group attached to Elastica EC2 ELBs"
}
