
resource "random_password" "sp-password" {
  length  = 32
  special = false
}

resource "azuread_application" "hexa" {
  name                       = "hexa-k8s"
  available_to_other_tenants = false
}

resource "azuread_service_principal" "hexa" {
  application_id = azuread_application.hexa.application_id
}

resource "azuread_service_principal_password" "hexa" {
  service_principal_id = azuread_service_principal.hexa.id
  value                = random_password.sp-password.result
  end_date_relative    = "87600h" #10y
}
