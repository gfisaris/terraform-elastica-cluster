resource "aws_elb_attachment" "elastica-elb_attach-ec2_instace-X" {
  elb      = "${aws_elb.ec2_elb-Elastica.id}"
  instance = ["${aws_instance.terraform-ec2_instance-X.id}"]
}
