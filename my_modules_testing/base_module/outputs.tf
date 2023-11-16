output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

output "virtual_network_name" {
  value = azurerm_virtual_network.virtual_network.name
}

output "virtual_network_id" {
    value = azurerm_virtual_network.virtual_network.id
  
}

output "private_subnet_id" {
  value = azurerm_subnet.private_subnet.id
}

output "public_subnet_id" {
  value = azurerm_subnet.public_subnet.id
}

output "public_ip_id" {
  value = azurerm_public_ip.public_ip.id
}