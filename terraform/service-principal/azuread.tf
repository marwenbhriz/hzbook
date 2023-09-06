
resource "random_password" "sp-password" {
  length  = 32
  special = false
}

resource "azuread_application" "hzbook" {
  name                       = "hzbook-k8s"
  available_to_other_tenants = false
}

resource "azuread_service_principal" "hzbook" {
  application_id = azuread_application.hzbook.application_id
}

resource "azuread_service_principal_password" "hzbook" {
  service_principal_id = azuread_service_principal.hzbook.id
  value                = random_password.sp-password.result
  end_date_relative    = "87600h" #10y
}
