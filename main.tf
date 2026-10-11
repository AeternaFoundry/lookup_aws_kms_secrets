data "aws_kms_secrets" "kms_secrets_lookup" {
  for_each = var.kms_secrets_lookup

  region = each.value.region

  dynamic "secret" {
    for_each = each.value.secret
    content {
      context              = secret.value.context
      encryption_algorithm = secret.value.encryption_algorithm
      grant_tokens         = secret.value.grant_tokens
      key_id               = secret.value.key_id
      name                 = secret.value.name
      payload              = secret.value.payload
    }
  }
}

