resource "azurerm_virtual_network" "red_aks" {
    name                = "myVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "westus"
    resource_group_name = "${var.rg_name}"


    tags = {
        environment = "aks-pro"
    }
}
