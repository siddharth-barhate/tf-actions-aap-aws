variable "region" {
  type    = string
  default = "us-east-1"
}

variable "name" {
  description = "Name prefix used for tagging and resource naming."
  type        = string
  default     = "tf-actions-aap"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.20.0.0/16"
}

variable "instance_type" {
  description = "EC2 instance type for created hosts."
  type        = string
  default     = "t3.micro"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
}

variable "key_pair_name" {
  description = "AWS EC2 key pair name used for SSH access."
  type        = string
  default     = null
}


variable "instance_count" {
  description = "Number of EC2 instances to create."
  type        = number
  default     = 2
}

variable "ubuntu_ami_name_glob" {
  description = "AMI name filter pattern used to discover the Ubuntu image."
  type        = string
  # Example: constrain to 2025 images; Terraform will pick the most recent AMI within 2025.
  default = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-2025*"
}

variable "ansible_user" {
  description = "Linux username for Ansible SSH"
  type        = string
  default     = "ubuntu"
}

variable "aap_job_template_id" {
  description = "AAP job template ID for VM patching (set after creating job template in AAP)"
  type        = number
  default     = 0

  validation {
    condition     = var.aap_job_template_id >= 0
    error_message = "Job template ID must be a non-negative number."
  }
}

variable "aap_insecure_skip_verify" {
  description = "Skip TLS verification for AAP provider. Set false in production (requires valid TLS cert on AAP)."
  type        = bool
  default     = false
}

variable "aap_host" {
  description = "AAP controller URL"
  type        = string
}

variable "aap_username" {
  description = "AAP username"
  type        = string
  sensitive   = true
}

variable "aap_password" {
  description = "AAP password"
  type        = string
  sensitive   = true
}