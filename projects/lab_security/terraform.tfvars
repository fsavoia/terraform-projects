region        = "us-east-1"
ip_saida      = "189.54.220.196/32"
instance_type = "t2.micro"
vpc_id        = "vpc-4b9f5236"
tags          = ["lab-security01", "lab-security02", "lab-security03"]
keyname       = "teste"
sg_ports      = [22]
key           = "demo.tfstate"
instancias    = 1
role          = "ssm-lab"