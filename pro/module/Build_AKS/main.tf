data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rsg" {
  name = var.resource_group
}

resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
    name                = var.name
    location            = var.location == null ? data.azurerm_resource_group.rsg.location : var.location
    resource_group_name = data.azurerm_resource_group.rsg.name
    dns_prefix          = var.dns_prefix
    kubernetes_version  = var.kubernetes_version

    agent_pool_profile {
        name            = var.agent_pool_name
        count           = var.agent_pool_count
        vm_size         = var.agent_pool_vm_size
        os_type         = var.agent_pool_os_type
        os_disk_size_gb = var.agent_pool_os_disk_size
        vnet_subnet_id  = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.agent_pool_vnet_rsg}/providers/Microsoft.Network/virtualNetworks/${var.agent_pool_vnet_name}/subnets/${var.agent_pool_subnet_name}"
    }

    service_principal {
        client_id     = var.client_id
        client_secret = var.client_secret
    }

    addon_profile {
      oms_agent {
        enabled                    = true
        log_analytics_workspace_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourcegroups/${var.lwk_resource_group_name}/providers/microsoft.operationalinsights/workspaces/${var.lwk-name}"
      }
    }

    network_profile {
        network_plugin = "azure"
        network_policy = "calico"
        
    }

    tags = {
        customer        = data.azurerm_resource_group.rsg.tags["customer"]
        environment     = data.azurerm_resource_group.rsg.tags["environment"]
        cost_center     = data.azurerm_resource_group.rsg.tags["cost_center"]
        product         = data.azurerm_resource_group.rsg.tags["product"]
        channel         = var.channel
        description     = var.description
        tracking_code   = var.tracking_code
        confidentiality = var.confidentiality
        integrity       = var.integrity
        availability    = var.availability
    }
}
