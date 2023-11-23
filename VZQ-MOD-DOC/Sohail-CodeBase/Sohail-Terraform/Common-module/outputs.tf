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
  value = azurerm_subnet.subnets[0].id
}

output "public_subnet_id" {
  value = azurerm_subnet.subnets[1].id
}

output "public_ip_address_id" {
  value = var.create_public_ip ? azurerm_public_ip.public_ip[0].id : null
}
