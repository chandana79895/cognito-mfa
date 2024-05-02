provider "aws" {
  region = "us-east-1"  # Update with your desired region
}

resource "aws_cognito_user_pool" "user_pool" {
  name = "sample-authentication-pool"

  # Account recovery mechanisms block
  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }

  # Admin create user config block
  admin_create_user_config {
    allow_admin_create_user_only = false
  }

  # Password policy block
  password_policy {
    minimum_length                   = var.minimum_length
    require_lowercase                = var.require_lowercase
    require_numbers                  = var.require_numbers
    require_symbols                  = var.require_symbols
    require_uppercase                = var.require_uppercase
    temporary_password_validity_days = 7
  }

  # Username configuration block
  username_configuration {
    case_sensitive = true
  }

  # Alias attributes
  alias_attributes = ["email", "preferred_username"]

  # Email configuration block
  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  # MFA configuration
  mfa_configuration = "OFF"

  # Schema block
  schema {
    attribute_data_type = "String"
    mutable             = true
    name                = "email"
    required            = true
  }

  schema {
    attribute_data_type = "String"
    mutable             = true
    name                = "preferred_username"
    required            = false
  }
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  user_pool_id = aws_cognito_user_pool.user_pool.id
  name  = "website-host"

  explicit_auth_flows                  = var.explicit_auth_flows
  generate_secret                      = var.generate_secret
  allowed_oauth_flows_user_pool_client = var.allowed_oauth_flows_user_pool_client
  allowed_oauth_flows                  = var.allowed_oauth_flows
  allowed_oauth_scopes                 = var.allowed_oauth_scopes
  enable_token_revocation              = true
  prevent_user_existence_errors        = "ENABLED"

  token_validity_units {
    refresh_token = "days"
    access_token  = "days"
    id_token      = "days"
  }

  access_token_validity = var.access_token_validity
  id_token_validity     = var.id_token_validity
  refresh_token_validity = var.refresh_token_validity

  supported_identity_providers = ["COGNITO"]

  callback_urls = var.callback_urls
  logout_urls   = var.logout_urls
}

resource "aws_cognito_user_pool_domain" "user_pool_domain" {
  domain      = "domain-test"
  user_pool_id = aws_cognito_user_pool.user_pool.id
}
