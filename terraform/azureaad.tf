terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "2.39.0"
    }
  }
}

provider "azuread" {
  # Configuration options
  tenant_id = "75668f36-65d3-4d90-a990-4bb8ec16728f"
}


########################################################333



data "azuread_client_config" "current" {}

resource "random_uuid" "widgets_scope_id" {}

resource "azuread_application" "example" {
  display_name     = "example"
  #identifier_uris  = ["api://example-app01"]
  # logo_image       = filebase64("/path/to/logo.png")
  #owners           = [data.azuread_client_config.current.object_id]
  #sign_in_audience = "AzureADMultipleOrgs"

  app_role {
    allowed_member_types = ["User", "Application"]
    description          = "Admins can manage roles and perform all task actions"
    display_name         = "Admin"
    enabled              = true
    id                   = random_uuid.widgets_scope_id.result
    value                = "admin"
  }

  app_role {
    allowed_member_types = ["User"]
    description          = "ReadOnly roles have limited query access"
    display_name         = "ReadOnly"
    enabled              = true
    id                   = "497406e4-012a-4267-bf18-45a1cb148a01"
    value                = "User"
  }
}
