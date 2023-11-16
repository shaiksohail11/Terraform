resource "azurerm_network_interface" "ml_nic" {
         count = length(var.ml_network_interface_names)

  name                = var.ml_network_interface_names[count.index]
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Static"
    private_ip_address            = var.ml_nic_private_ip_addresses[count.index]
    subnet_id                     = var.private_subnet_id
  }

}

resource "azurerm_network_security_group" "ml_nsg" {
    count = length(var.ml_network_interface_names)

  name                = var.ml_nsg_names[count.index]
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
     count = length(var.ml_network_interface_names)

  network_interface_id      = azurerm_network_interface.ml_nic[count.index].id
  network_security_group_id = azurerm_network_security_group.ml_nsg[count.index].id
}

resource "azurerm_windows_virtual_machine" "ml_vm" {
    count = length(var.ml_network_interface_names)

  name                  = var.ml_vm_names[count.index]
  resource_group_name   = var.resource_group_name
  location              = var.resource_group_location
  network_interface_ids = [azurerm_network_interface.ml_nic[count.index].id]
  admin_username        = var.ml_vm_admin_username[count.index]
  admin_password        = var.ml_vm_admin_password[count.index]
  size                  = var.ml_vm_type[count.index]
  priority              = var.is_ml_spot_vm ? "Spot" : "Regular"
  eviction_policy       = var.is_ml_spot_vm ? "Deallocate" : null




  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  }


resource "azurerm_managed_disk" "managed_disk" {
   count = length(var.ml_network_interface_names)

  name                 = var.ml_disk_names[count.index]
  resource_group_name   = var.resource_group_name
  location              = var.resource_group_location
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.ml_disk_sizes[count.index]
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
    count = length(var.ml_network_interface_names)

  managed_disk_id    = azurerm_managed_disk.managed_disk[count.index].id
  virtual_machine_id = azurerm_windows_virtual_machine.ml_vm[count.index].id
  lun                = 0
  caching            = "ReadWrite"
}