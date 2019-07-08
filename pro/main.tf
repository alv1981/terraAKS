provider "azurerm" {
}
data "terraform_remote_state" "pro" {
  backend = "azurerm"
  config = {
    storage_account_name = "tfstalabscastillo"
    container_name       = "tfstate"
    key                  = "prod/aks.tfstate"
    resource_group_name  = "aks-pro" 
    access_key           = "5hdJ0UfY6zX2hwddnllVhBRLOmpgystxIyMmhoBcira+MSdRPLLMeHTExn4JFIscPDuL/4TkhKbl/6VVX9lIdA=="
   
    
  }
}
    
 
module "red" {
  source = "./module/red"
  
}
