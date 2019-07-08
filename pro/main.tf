provider "azurerm" {
}
data "terraform_remote_state" "pro" {
  backend = "azurerm"
  config = {
    storage_account_name = "tfstalabscastillo"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    resource_group_name  = "aks-pro" 
   
    
  }
}
    
 
module "red" {
  source = "./module/red"
  
}
