variable "region" {
  type    = string
  default = "us-east-1"
}

variable "name" {
  type    = string
  default = "tf-actions-aap"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
}

variable "key_pair_name" {
  type        = string
  description = "Existing EC2 Key Pair name to attach to the instance (for SSH)."
  default     = null
}


variable "instance_count" {
  type        = number
  description = "Number of EC2 instances to create."
  default     = 1
}

variable "ubuntu_ami_name_glob" {
  description = "AMI name glob to select an older-but-available Ubuntu 22.04 image for patching demos (tune year/date as needed)."
  type        = string
  # Example: constrain to 2023 images; Terraform will pick the most recent AMI within 2023.
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-2025*"
}

variable "ansible_user" {
  description = "Linux username for Ansible SSH (must match Vault SSH role allowed_users)"
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

# variable "aap_server_ip" {
#   description = "AAP server public IP for firewall rules (required for production)"
#   type        = string
#   default     = ""

#   validation {
#     condition     = var.environment != "production" || (var.aap_server_ip != "" && can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", var.aap_server_ip)))
#     error_message = "AAP server IP is required for production environment and must be a valid IPv4 address."
#   }
# }

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