resource "azurerm_network_interface" "nic" {
  count = length(var.network_interface_names)

  name                = var.network_interface_names[count.index]
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Static"
    private_ip_address            = var.nic_private_ip_addresses[count.index]
    subnet_id                     = count.index == 0 ? var.public_subnet_id : var.private_subnet_id
    #count.index == 0 ? var.public_subnet_id : var.private_subnet_id
    public_ip_address_id          = count.index == 0 ? var.public_ip_address_id : null
  }

}

resource "azurerm_network_security_group" "nsg" {
  count = length(var.network_interface_names)

  name                = var.nsg_names[count.index]
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  security_rule {
    name                       = "DenyAllInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_nic_association" {
  count = length(var.network_interface_names)

  network_interface_id      = azurerm_network_interface.nic[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg[count.index].id
}

resource "azurerm_linux_virtual_machine" "vm" {
  count = length(var.network_interface_names)

  name                            = var.vm_names[count.index]
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  network_interface_ids           = [azurerm_network_interface.nic[count.index].id]
  admin_username                  = var.vm_admin_username[count.index]
  admin_password                  = var.vm_admin_password[count.index]
  size                            = var.vm_type[count.index]
  priority                        = var.is_it_spot_vm[count.index] ? "Spot" : "Regular"
  eviction_policy                 = var.is_it_spot_vm[count.index] ? "Deallocate" : null
  disable_password_authentication = false


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts-gen2"
      version   = "latest"
    
  }
}

resource "azurerm_managed_disk" "managed_disk" {
  count = length(var.network_interface_names)

  name                 = var.disk_names[count.index]
  resource_group_name  = var.resource_group_name
  location             = var.resource_group_location
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.disk_sizes[count.index]
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count = length(var.network_interface_names)

  managed_disk_id    = azurerm_managed_disk.managed_disk[count.index].id
  virtual_machine_id = azurerm_linux_virtual_machine.vm[count.index].id
  lun                = 0
  caching            = "ReadWrite"
}