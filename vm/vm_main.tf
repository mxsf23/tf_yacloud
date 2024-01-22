resource "yandex_compute_instance" "vm-01" {
  name = var.name
  hostname = var.hostname

  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 20
      type = "network-hdd"
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = var.ssh_keys
    user-data = var.user_data
  }
}