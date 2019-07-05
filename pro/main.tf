provider "azurerm" {
}

    }
} 
module "red" {
  source = "./module/red"
  rg_name= "${var.rg_name}"
}
