resource "azurerm_virtual_network" "red_aks" {
    name                = "myVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "westus"
    resource_group_name = "${azurerm_resource_group.rg.name}"


    tags = {
        environment = "${entorno}"
    }
    
}
resource "azurerm_resource_group" "rg" {
        name = "${var.resource_group_name}"
        location = "westus"
        tags = {
        environment = "${entorno}"
            } 
}
