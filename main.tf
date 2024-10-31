# Set the required provider and versions
terraform {
  required_providers {
    # We recommend pinning to the specific version of the Docker Provider you're using
    # since new versions are released frequently
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "ssh" {
    host = var.host
    username = var.username
    private_key = file(var.private_key_path)
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

