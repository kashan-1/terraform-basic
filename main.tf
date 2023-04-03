terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "app_server" {
  ami = "ami-0b5eea76982371e91" # Amazon Linux AMI ID in us-east-1 region
  #ami           = "ami-0574da719dca65348"  # Ubuntu Linux AMI ID in us-east-1 region
  key_name      = aws_key_pair.generated_key.key_name
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name #variable path to instance name stored in vatiable.tf
  }
}
