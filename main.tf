provider "ssh" {
    host = var.host
    username = var.username
    private.key = file(var.private_key_path)
}


resource "null_resource" "nginx_container" {
  provisioner "remote-exec" {
    inline = [
        "docker pull nginx:latest",
        "docker run -d --name nginx-server 80:80 nginx-latest"
    ]
  } 
  connection {
    type = "ssh"
    host = var.host
    user = var.username
    private_key = file(var.private_key_path)
  }
 
}


variable "host" {}
variable "username" {}
variable "private_key_path" {}

