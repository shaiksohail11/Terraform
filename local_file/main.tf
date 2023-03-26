resource "local_file" "practice_terraform" {
  filename = var.filename
  content = "My favorite pet is ${random_pet.my_pet.id}"
}

resource "random_pet" "my_pet" {
    prefix = var.prefix
    length = var.length
  
}