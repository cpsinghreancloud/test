variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "172.31.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "172.31.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "172.31.2.0/24"
}

variable "ami" {
  description = "Ubuntu"
  default = "ami-0a313d6098716f372"
}

variable "key_name" {
 default = "testkey"
}

variable "Elastic_IP" {
     description = "elastic IP"
     default = "54.167.199.91"
}
