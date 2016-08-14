variable "aws_access_key" {
    decscription = "AWS Access Key"
}

variable "aws_secret_key" {
    description = "AWS Secret Key"
}

variable "aws_region" {
    description = "Which AWS Region will be used ?"
    default = "eu-west-1"
}

variable "key_path" {
    description = "Path to the private portion of the SSH key specified."
}

variable "myip_cidr_block" {
    description = "Your CIDR from which you wish to access the ElasticSearch Cluster."
    default = "0.0.0.0/0"
}
