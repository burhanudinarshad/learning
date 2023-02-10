provider "azurerm" {
}

module "aks_cluster" {
  source = "azure/aks/azurerm"
  #version = "6.6.0"

  # Replace the following placeholder values with your own
  resource_group_name = "example-aks-rg"
  cluster_name        = "example-aks-cluster"
  location            = "westus2"

  # Configuration for the AKS cluster
  default_node_pool {
    name           = "default"
    node_count     = 2
    vm_size        = "Standard_D2_v2"
  }
}


variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "resource_group" {
  description = "Name of the resource group where the AKS cluster will be created"
  type        = string
}

variable "location" {
  description = "Location of the AKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to be used for the AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
}

variable "node_vm_size" {
  description = "Size of the virtual machines that will be used as nodes in the AKS cluster"
  type        = string
}

variable "ssh_key" {
  description = "Public SSH key to be used for the AKS cluster"
  type        = string
}

variable "service_principal_client_id" {
  description = "Service principal client ID for the AKS cluster"
  type        = string
}

variable "service_principal_client_secret" {
  description = "Service principal client secret for the AKS cluster"
  type        = string
}
