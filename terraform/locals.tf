locals {
  ssm_ignore_changes = [
    {
      parameter = "client-db-automation-SourceDBUser"
      type      = "SecureString"
      value     = "changeme"
    },
    {
      parameter = "client-db-automation-SourceDBHost"
      type      = "SecureString"
      value     = "changeme"
    },
    {
      parameter = "client-db-automation-SourceDBName"
      type      = "SecureString"
      value     = "changeme"
    },
    {
      parameter = "client-db-automation-SourceDBPassword"
      type      = "SecureString"
      value     = "changeme"
    },
    {
      parameter = "client-db-automation-SourceDBport"
      type      = "SecureString"
      value     = "changeme"
    },
    {
      parameter = "client-db-automation-Destinations3Bucket"
      type      = "SecureString"
      value     = "changeme"
    }
  ]
  tags = {
    ManagedBy   = "Terraform"
    Environment = var.env
  }
}
