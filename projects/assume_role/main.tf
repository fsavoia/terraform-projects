provider "aws" {
  region     =  "us-east-1"
  #profile    =  "sts-demo"
  assume_role {
    role_arn = "arn:aws:iam::321553734277:role/sts-demo"
    session_name = "savoia-demo-sts"
  }
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "instance_lab" {
  ami                    = data.aws_ami.app_ami.id
  instance_type          = var.instance_type

  tags = {
    "Name" = "terraform-cloud-ec2"
  }

}