data "yandex_compute_image" "my_image" {
  family = "lemp"
}

module "s3_storage_config" {
  source = "./storage"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
  sa_id     = var.sa_id

}
module "vm_create" {
  source = "./vm"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
  sa_id     = var.sa_id
  image_id = data.yandex_compute_image.my_image.id
  vm_count = 2
  subnet_id = "${module.network.subnet_id}"
  network_id = "${module.network.network_id}"
  ssh_keys = "ubuntu:${file("../sftest.pub")}" // Path to ssh-key file
  user_data = "${file("../user-data.yaml")}"   // Path to cloud-init config file

  providers = {
    yandex.primary = yandex
  }
  for_each = var.vms
  name = each.key
  hostname = each.value.hostname
 
}

module "network" {
  source = "./network"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
  sa_id     = var.sa_id
  network_name = var.network_name
  subnet_name = var.subnet_name
  v4_cidr_blocks = var.v4_cidr_blocks

  providers = {
    yandex.primary = yandex
  }
 
}

