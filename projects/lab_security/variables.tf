variable "region" {}
variable "ip_saida" {}
variable "instance_type" {}
variable "vpc_id" {}
variable "keyname" {}
variable "key" {}
variable "instancias" {}
variable "role" {}
variable "tags" {
  type = list
}
variable "sg_ports" {
  type        = list(number)
}