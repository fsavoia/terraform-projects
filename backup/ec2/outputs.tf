output "ip_publico" {
  value = zipmap(aws_instance.ec2_instances.*.id,aws_instance.ec2_instances.*.public_ip)
}

output "timestamp" {
  value = local.time
}