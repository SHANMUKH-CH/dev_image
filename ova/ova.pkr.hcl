variable "network_adapter_name" {
  type    = string
  default = "VirtualBox Host-Only Ethernet Adapter"
}

variable "base_ova_path" {
  type    = string
  default = "D:/git-repos/dev_image/ova/AlmaLinux_9_4_x86_64_minimal.ova"
}

variable "customized_ova_path" {
  type    = string
  default = "D:/git-repos/dev_image/ova/custom_almalinux_el9.ova"
}

packer {
  required_plugins {
    virtualbox = {
      version = "~> 1"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}

source "virtualbox-ovf" "almalinux" {
  source_path      = var.base_ova_path
  vm_name          = "custom_almalinux_el9"
  boot_wait        = "10s"
  ssh_username     = "terrorblade"
  ssh_password     = "metamorphosis"
  ssh_timeout      = "10m"
  shutdown_command = "echo 'metamorphosis' | sudo -S shutdown -P now"
  skip_export      = false
  format           = "ova"

  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--memory", "2048"],
    ["modifyvm", "{{.Name}}", "--cpus", "2"],
    ["modifyvm", "{{.Name}}", "--nat-localhostreachable1", "on"]
  ]
}

build {
  sources = [
    "source.virtualbox-ovf.almalinux"
  ]

  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo yum install -y git",
      "sudo yum install -y vim",
      "sudo yum install -y wget",
      "sudo yum install -y curl",
      "sudo yum install -y zsh",
    ]
  }
}