terraform {
    required_providers {
      docker = {
        source = "kreuzwerker/docker",
        vesrion = "~>2.0"
      }
    }
}
resource "docker_container" "nginx" {
   image = "nginx:latest"
   name = "nginx"
   ports {
    internal = 80
    external = 80
   }
}

# provider "docker" {
#     host = "ssh://adrian@20.215.225.197"
#     password = ""
# }

