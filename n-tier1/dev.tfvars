region                 = "us-west-2"
vpc_cidr               = ["192.168.0.0/16", "10.0.0.0/16"]
firstsubnet_cidrs      = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
firstsubnet_name_tags  = ["Subnet1", "Subnet2", "Subnet3", "Subnet4"]
Secondsubnet_cidr      = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
Secondsubnet_name_tags = ["Subnet0", "Subnet2", "Subnet3", "Subnet4"]