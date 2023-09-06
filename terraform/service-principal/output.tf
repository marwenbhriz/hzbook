output "service_principal_client_id" {
  value = azuread_service_principal.hexa.application_id
}

output "service_principal_password" {
  value = azuread_service_principal_password.hexa.value
}
