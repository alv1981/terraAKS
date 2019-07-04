# Common variables

variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Storage Account. Changing this forces a new resource to be created. Must be globally unique. See CCoE Naming section for all restrictions."
}

variable "resource_group" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Storage Account."
}

variable "location" {
  type        = string
  description = "(Optional) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  default     = null
}

variable "channel" {
  type        = string
  description = "(Optional) Distribution channel to which the associated resource belongs to."
  default     = ""
}

variable "description" {
  type        = string
  description = "(Required) Provide additional context information describing the resource and its purpose."
}

variable "tracking_code" {
  type        = string
  description = "(Required) Allow this resource to be matched against internal inventory systems."
}

variable "confidentiality" {
  type        = string
  description = "(Required) Confidentiality."
}

variable "integrity" {
  type        = string
  description = "(Required) Integrity."
}

variable "availability" {
  type        = string
  description = "(Required) Availability."
}

variable "lwk-name" {
  type        = string
  description = "(Required) The name of a Log Analytics Workspace where Diagnostics Data should be sent."
}

variable "lwk_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group the KVT and LWK are located in."
}

#Custom variables

variable "dns_prefix" {
  type        = string
  description = "(Required) Specifies the clusters default domain."
}

variable "kubernetes_version" {
  type        = string
  description = "(Optional) Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
  default     = null
}

variable "agent_pool_name" {
  type        = string
  description = "(Required)  Specifies the name of the agent pool to be created"
}

variable "agent_pool_count" {
  description = "(Required) Specifies the number of nodes to be created in the pool."
  default = 2
}

variable "agent_pool_vm_size" {
  type        = string
  description = "(Required) The size of the agents in the pool."
}

variable "agent_pool_os_type" {
  type        = string
  description = "(Optional) The Operating System used for the Agents [Linux and Windows]. Changing this forces a new resource to be created. Defaults to Linux."
  default = "Linux"
}

variable "agent_pool_os_disk_size" {
    description = "(Required) Size in GB of the agents OS."
    default = null
}

variable "agent_pool_vnet_rsg" {
    description = "(Required) The name of the resource group where the Virtual network is located. Changing this forces a new resource to be created."
}

variable "agent_pool_vnet_name" {
    description = "(Required) The name of the Virtual network where the Agents in the Pool should be provisioned. Changing this forces a new resource to be created."
}

variable "agent_pool_subnet_name" {
    description = "(Required) The name of the Subnet where the Agents in the Pool should be provisioned. Changing this forces a new resource to be created."
}

variable "client_id" {
    description = "(Required) The Client ID for the Service Principal. Changing this forces a new resource to be created."
}

variable "client_secret" {
    description = "(Required) The Client Secret for the Service Principal. Changing this forces a new resource to be created."
}
