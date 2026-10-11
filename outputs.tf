output "kms_secrets_lookup_id" {
  description = "Map of id values across all kms_secrets_lookup, keyed the same as var.kms_secrets_lookup"
  value       = { for k, v in data.aws_kms_secrets.kms_secrets_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kms_secrets_lookup_plaintext" {
  description = "Map of plaintext values across all kms_secrets_lookup, keyed the same as var.kms_secrets_lookup"
  value       = { for k, v in data.aws_kms_secrets.kms_secrets_lookup : k => v.plaintext if v.plaintext != null && length(v.plaintext) > 0 }
  sensitive   = true
}
output "kms_secrets_lookup_region" {
  description = "Map of region values across all kms_secrets_lookup, keyed the same as var.kms_secrets_lookup"
  value       = { for k, v in data.aws_kms_secrets.kms_secrets_lookup : k => v.region if v.region != null && length(v.region) > 0 }
}
output "kms_secrets_lookup_secret" {
  description = "Map of secret values across all kms_secrets_lookup, keyed the same as var.kms_secrets_lookup"
  value       = { for k, v in data.aws_kms_secrets.kms_secrets_lookup : k => v.secret if v.secret != null && length(v.secret) > 0 }
}

