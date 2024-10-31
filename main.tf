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

# Configure the docker provider
provider "docker" {
 # host = "ssh://adrian@20.215.225.197" 
   host = "tcp://20.215.225.197:2375"

}

variable "docker_password" {
  type = string
  sensitive = true
}

# Create a docker image resource
# -> docker pull nginx:latest
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

# Create a docker container resource
# -> same as 'docker run --name nginx -p8080:80 -d nginx:latest'
resource "docker_container" "nginx" {
  name    = "nginx"
  image   = docker_image.nginx.image_id

  ports {
    external = 8080
    internal = 80
  }
}
