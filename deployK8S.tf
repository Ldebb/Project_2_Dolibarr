provider "azurerm" {
} 

resource "azurerm_resource_group" "test" {
  name     = "fitec.clusterRG"
  location = "East US"
}

resource "azurerm_public_ip" "pip1" {
  name                = "k8s-pip1"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  domain_name_label = "fitecp2"
  allocation_method   = "Static"
}

resource "azurerm_kubernetes_cluster" "test" {
  name                = "clusterfitec"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  dns_prefix          = "clusterfitec"

  agent_pool_profile {
    name            = "agent001"
    count           = 1
    vm_size         = "Standard_D1_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  agent_pool_profile {
    name            = "agent002"
    count           = 1
    vm_size         = "Standard_D2_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "574be205-4131-4e77-8153-4e366c0379ae"
    client_secret = "860b6e62-9e94-4a12-b6cb-5c8c169304f5"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.test.kube_config.0.client_certificate}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.test.kube_config_raw}"
}

