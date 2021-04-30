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
  vpc_security_group_ids = var.sg_id
  key_name               = var.keyname
  count                  = var.instancias
  iam_instance_profile   = var.role

  tags = {
    Name = element("${var.tags}", "${count.index}")
  }

  #  provisioner "remote-exec" {
  #    inline = [
  #      "sudo yum update -y",
  #      "sudo yum install -y httpd",
  #      "sudo echo '<h1>Hello World From EC2 via Terraform!</h1>' > /var/www/html/index.html",
  #      "sudo systemctl start httpd",
  #      "sudo systemctl enable httpd"
  #    ]

  #  connection {
  #    type = "ssh"
  #    user = "ec2-user"
  #    private_key = file("./teste.pem")
  #    host = self.public_ip
  #  }

  # }
}