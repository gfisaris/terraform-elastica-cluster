resource "aws_key_pair" "elasticaEC2Admin" {
  key_name	= "elasticaEC2Admin" 
  public_key	= "${file("${var.keypub_path}")}"
}
