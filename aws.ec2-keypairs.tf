resource "aws_key_pair" "elasticaEC2Admin" {
  key_name	= "elasticaEC2Admin" 
  public_key	= "${file("${path.module}/${var.keypub_path}")}"
}
