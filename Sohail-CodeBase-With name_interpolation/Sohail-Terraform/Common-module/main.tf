resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location

}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "voziq_${azurerm_resource_group.rg.location}_${var.client_name}_${var.virtual_network_name}_${var.environment_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = [var.virtual_network_address_space]

}

resource "azurerm_subnet" "subnets" {
   count = length(var.subnet_names)

  name                 = "voziq_${azurerm_resource_group.rg.location}_${var.client_name}_${var.subnet_names[count.index]}_${var.environment_name}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.subnet_address_prefixes[count.index]]
}


resource "azurerm_public_ip" "public_ip" {
  count = var.create_public_ip ? 1 : 0

  name                = "voziq_${azurerm_resource_group.rg.location}_${var.client_name}_app_${var.public_ip_name}_${var.environment_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.resource_group_location
  allocation_method   = "Static"
}
