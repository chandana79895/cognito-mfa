#COGNITO

minimum_length = "8"
require_lowercase = true
require_numbers = true
require_symbols = true
require_uppercase = true
explicit_auth_flows                  = ["ALLOW_USER_SRP_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
generate_secret                      = true
allowed_oauth_flows_user_pool_client = true
allowed_oauth_flows                  = ["code"]
allowed_oauth_scopes                 = ["email", "openid"]
access_token_validity = 1
id_token_validity     = 1
refresh_token_validity = 30
callback_urls = ["http://localhost:8000/logged_in.html"]
logout_urls   = ["http://localhost:8000/logged_out.html"]