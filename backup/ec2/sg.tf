# Creating Security Group
resource "aws_security_group" "sg_ec2" {
  name        = "SG_PUBLIC_ACCESS"
  description = "Allow public inbound traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [var.ip_saida]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SG_PUBLIC_ACCESS"
  }

}