provider "aws" {
  region     = var.region
}

module "sg" {
  #source    = "git::https://github.com/fsavoia/terraform-labs.git//modules/aws/sg"
  source    = "../../modules/aws/sg"

 
  vpc_id    = var.vpc_id
  sg_ports  = var.sg_ports
  ip_saida  = var.ip_saida  
}

module "ec2" {
  #source = "git::https://github.com/fsavoia/terraform-labs.git//modules/aws/ec2"
  source             = "../../modules/aws/ec2"

  instance_type     = var.instance_type
  sg_id             = module.sg.sg_id
  keyname           = var.keyname
  tags              = var.tags
}

output "ip_publico" {
    value = module.ec2.*.ip_publico
} 

