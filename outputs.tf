output "vpc_id" {
  description = "ID of the created VPC."
  value       = aws_vpc.this.id
}

output "instance_id" {
  description = "IDs of created EC2 instances."
  value       = aws_instance.this[*].id
}
