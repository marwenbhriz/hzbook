output "service_principal_client_id" {
  value = azuread_service_principal.hzbook.application_id
}

output "service_principal_password" {
  value = azuread_service_principal_password.hzbook.value
}
