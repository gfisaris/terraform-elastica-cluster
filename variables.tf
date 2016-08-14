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
    description = "Path to the private portion of the SSH Key that will be used"
}

variable "keypub_path" {
    description = "Path to the public portion of the SSH Key that will be used"
}

variable "myip_cidr_block" {
    description = "Your CIDR from which you wish to access the ElasticSearch Cluster."
    default = "0.0.0.0/0"
}

variable "aws_amis" {
  default = {
    "eu-west-1"         = "ami-7abd0209"
    "eu-central-1"      = "ami-9bf712f4"
    "us-east-1"         = "ami-6d1c2007"
    "us-west-1"         = "ami-af4333cf"
    "us-west-2"         = "ami-d2c924b2"
    "sa-east-1"         = "ami-26b93b4a"
    "ap-south-1"        = "ami-95cda6fa"
    "ap-northeast-1"    = "ami-eec1c380"
    "ap-northeast-2"    = "ami-c74789a9"
    "ap-southeast-1"    = "ami-f068a193"
    "ap-southeast-2"    = "ami-fedafc9d"
  }
}
