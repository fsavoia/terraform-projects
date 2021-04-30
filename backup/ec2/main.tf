# Creating EC2
data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ec2_instances" {
  ami                    = data.aws_ami.app_ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_ec2.id]
  key_name               = var.keyname
  count                  = 3
  user_data              = file("scripts/install_apache.sh")

  tags = {
    Name = element("${var.tags}", "${count.index}")
  }
}