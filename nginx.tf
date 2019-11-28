provider "docker" {
}

resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
}

resource "docker_container" "nginx-server" {
  name  = "nginx-server"
  image = docker_image.nginx.latest
  ports {
    internal = 80
  }
  upload {
    content = file("config/nginx.conf")
    file    = "/etc/nginx/nginx.conf"
  }
}
