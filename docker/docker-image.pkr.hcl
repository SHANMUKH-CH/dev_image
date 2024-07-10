variable "docker_image" {
  type    = string
  default = "ubuntu:latest"
}

variable "docker_repository" {
  type    = string
  default = "shanumbra/dev"
}

source "docker" "ubuntu" {
  image  = var.docker_image
  commit = true
}

build {
  name = var.docker_repository
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "file" {
    source      = "scripts/configure.sh" # Source path of the script
    destination = "/tmp/configure.sh"    # Destination path inside the container
  }

  provisioner "shell" {
    inline = [
      "chmod +x /tmp/configure.sh", # Make the script executable
      "/tmp/configure.sh",          # Execute the script
      "rm /tmp/configure.sh"        # Remove the script
    ]
  }

  post-processors {
    post-processor "docker-tag" {
      repository = var.docker_repository
      tags       = ["latest"]
    }
    post-processor "manifest" {
      output     = "packer-manifest.json"
      strip_path = true
    }
  }
}