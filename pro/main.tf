provider "azurerm" {
}
resource "azurerm_resource_group" "rg" {
        name = "${var.rg_name}"
        location = "westus"
        tags = {
        environment = "aks-pro"
    }
} 
module "red" {
  source = "./module/red"
  rg_name= "${var.rg_name}"
}
