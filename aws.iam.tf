resource "aws_iam_role" "es-ec2admin" {
        name                    = "Elastica-EC2Admin"
        assume_role_policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
POLICY

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_policy" "es-discovery" {
	name		= "Elastica-AWS.EC2.Discovery"
	description	= "Allows listing of EC2 Instances. Used by ElasticSearch AWS EC2 Cluster Discovery plugin"
	policy		= <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:DescribeInstances"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy_attachment" "es-iam_pol_att" {
	name		= "es-ec2admin-discovery"
	roles		= ["${aws_iam_role.es-ec2admin.name}"]
	policy_arn	= "${aws_iam_policy.es-discovery.arn}"
}

resource "aws_iam_instance_profile" "es-ec2instance" {
	name = "es-ec2-instance-profile"
	path = "/"
	roles = ["${aws_iam_role.es-ec2admin.name}"]

	lifecycle {
		create_before_destroy = true
	}
}
