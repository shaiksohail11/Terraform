resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location

}

resource "azurerm_virtual_network" "virtual_network" {
    count = length(var.virtual_network_name)

  name                = var.virtual_network_name[count.index]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = [var.virtual_network_address_space[count.index]]

}

resource "azurerm_subnet" "private_subnet" {
     count = length(var.private_subnet_name)
  name                 = var.private_subnet_name[count.index]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network[count.index].name
  address_prefixes     =[ var.private_subnet_address_prefixes[count.index]]
}

resource "azurerm_subnet" "public_subnet" { 
  count = var.create_resource ? 1 : 0

  name                 = var.public_subnet_name[count.index]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network[count.index].name
  address_prefixes     = [var.public_subnet_address[count.index]]

}

resource "azurerm_public_ip" "public_ip" {
  count = var.create_resource ? 1 : 0

  name                = var.public_ip_name[count.index]
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.resource_group_location
  allocation_method   = "Static"
}



resource "azurerm_network_interface" "nic" {
  count = length(var.network_interface_names)

  name                = var.network_interface_names[count.index]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Static"
    private_ip_address            = var.nic_private_ip_addresses[count.index]
    subnet_id                     = azurerm_subnet.private_subnet[0].id 
    # public_ip_address_id          = count.index == 1 ? azurerm_public_ip.public_ip[0].id : null
    # azurerm_subnet.private_subnet[0].id 

    # For specific nic to be public we use :
    # Make create_resource = true in .tfvars file
    #count.index == 1 ? azurerm_subnet.public_subnet[0].id : azurerm_subnet.private_subnet[0].id
    #count.index == 1 ? azurerm_public_ip.public_ip[0].id : null
    # Change the required private_ip_address with public subnet address in the .tfvars file
    # for ex: if we have public subnet with 192.168.2.0/24 then private_ip_adress would be 192.168.2.1

    #For first 2 nic to be public we use :
    # If we want to make first 2 public and others private, we can use count.index < 2 ? azurerm_subnet.public_subnet[0].id : azurerm_subnet.private_subnet[0].id
    #count.index < 2 ? azurerm_public_ip.public_ip[0].id : null
    # Change the required private_ip_address with public subnet address in the .tfvars file
    # for ex: if we have public subnet with 192.168.2.0/24 then private_ip_adress would be 192.168.2.1
  }

}

resource "azurerm_network_security_group" "nsg" {
  count = length(var.network_interface_names)

  name                = var.nsg_names[count.index]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
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
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  network_interface_ids           = [azurerm_network_interface.nic[count.index].id]
  admin_username                  = var.vm_admin_username[count.index]
  admin_password                  = var.vm_admin_password[count.index]
  size                            = var.vm_type[count.index]
  priority                        = var.is_it_spot_vm ? "Spot" : "Regular"
  eviction_policy                 = var.is_it_spot_vm ? "Deallocate" : null
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
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
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