locals {
  extra_vars = {
    # VM IPs — playbook uses add_host to build inventory dynamically
    vm_hosts = { for vm in aws_instance.this : try(vm.tags["Name"], vm.id) => vm.public_ip if vm.public_ip != null }

    # SSH user
    ansible_user   = var.ansible_user
    vault_ssh_user = var.ansible_user
    
    # Patch config
    patch_type_input     = "security"
    reboot_allowed_input = false
  }
}


action "aap_job_launch" "patch_vms" {
  config {
    job_template_id                     = var.aap_job_template_id
    wait_for_completion                 = true
    wait_for_completion_timeout_seconds = 1800
    extra_vars                          = jsonencode(local.extra_vars)
  }
}

resource "terraform_data" "trigger_patch" {
  count = var.aap_job_template_id > 0 ? 1 : 0

  input = {
    vm_ids = [for vm in aws_instance.this : vm.id]
  }

  lifecycle {
    action_trigger {
      events  = [after_create, after_update]
      actions = [action.aap_job_launch.patch_vms]
    }
  }
}

