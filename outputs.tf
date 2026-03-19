output "vpc_id" {
  value = aws_vpc.this.id
}

output "instance_id" {
  value = aws_instance.this[*].id
}

output "debug_extra_vars" {
  value = local.extra_vars
}