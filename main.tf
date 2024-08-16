terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.00"
    }
    
  }
  
  required_version = ">= 1.2.0"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.12.1"
  name = "AG_TF_Learn"
  cidr = "10.0.0.0/16"
azs = ["us-east-1a", "us-east-1b"]
private_subnets = ["10.0.0.0/24", "10.0.1.0/24"] 
public_subnets = ["10.0.50.0/24", "10.0.51.0/24"]

enable_nat_gateway = true


}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.small"
  
  tags = {
    Name = var.instance_name
  }
}

