module "params-ignore-changes" {
  source  = "Cloud-42/ssm-parameter/aws"
  version = "2.1.0"

  for_each = {
    for item in local.ssm_ignore_changes : item.parameter => item
  }

  name        = each.value.parameter
  description = each.value.parameter
  type        = each.value.type
  value       = each.value.value

  contact       = "none"
  orchestration = "https://github.com/client/client-devops-terraform"
  environment   = var.env
}

