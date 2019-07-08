provider "azurerm" {
}
terraform {
  backend "azurerm" {
  }

}
    
 
module "red" {
  source = "./module/red"
  
}
