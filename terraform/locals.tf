locals {
  ssm_ignore_changes = [
    {
      parameter = "PREFIX-SourceDBUser"
      type      = "SecureString"
      value     = "changeme"
    },
    {
      parameter = "PREFIX-SourceDBHost"
      type      = "SecureString"
      value     = "changeme"
    },
    {
      parameter = "PREFIX-SourceDBName"
      type      = "SecureString"
      value     = "changeme"
    },
    {
      parameter = "PREFIX-SourceDBPassword"
      type      = "SecureString"
      value     = "changeme"
    },
    {
      parameter = "PREFIX-SourceDBport"
      type      = "SecureString"
      value     = "changeme"
    },
    {
      parameter = "PREFIX-Destinations3Bucket"
      type      = "SecureString"
      value     = "changeme"
    }
  ]
  tags = {
    ManagedBy   = "Terraform"
    Environment = var.env
  }
}
