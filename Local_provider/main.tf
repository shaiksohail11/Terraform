resource "local_file" "first-file" {
    content = "Hello this is from terraform"
    filename = "./hello.txt"
  
}