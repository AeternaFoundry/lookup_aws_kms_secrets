variable "kms_secrets_lookup" {
  description = <<EOT
Map of kms_secrets_lookup, attributes below
Required:
    - secret (block):
        - context (optional)
        - encryption_algorithm (optional)
        - grant_tokens (optional)
        - key_id (optional)
        - name (required)
        - payload (required)
Optional:
    - region
EOT

  type = map(object({
    region = optional(string)
    secret = list(object({
      context              = optional(map(string))
      encryption_algorithm = optional(string)
      grant_tokens         = optional(list(string))
      key_id               = optional(string)
      name                 = string
      payload              = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.kms_secrets_lookup : (
        length(v.secret) >= 1
      )
    ])
    error_message = "Each secret list must contain at least 1 items"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

