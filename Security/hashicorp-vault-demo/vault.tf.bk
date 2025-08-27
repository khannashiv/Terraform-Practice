provider "vault" {
  address = "http://35.175.194.68:8200"
  token = "root"
}

data "vault_generic_secret" "db_Creds" {
  path = "secret/db_creds"
}

output "pull_db_creds_vault" {
  value = data.vault_generic_secret.db_Creds.data_json
  sensitive = true
}