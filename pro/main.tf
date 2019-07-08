provider "azurerm" {
}
#data "terraform_remote_state" "pro" {
 # backend = "azurerm"
  #  storage_account_name = "tfstalabscastillo"
   # container_name       = "tfstate"
    #key                  = "prod.terraform.tfstate"

   
    
  #}
#}
    
 
module "red" {
  source = "./module/red"
  
}
