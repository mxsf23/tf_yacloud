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
  # image_id = data.yandex_compute_image.my_image_01.id

  subnet_id = "${module.network.subnet_id}"
  network_id = "${module.network.network_id}"
  ssh_keys = "ubuntu:${file("../sftest.pub")}" // Path to ssh-key file
  user_data = "${file("../user-data.yaml")}" // Path to cloud-init config

  providers = {
    yandex.primary = yandex
  }
  for_each = local.vms
  name = each.key
  hostname = each.value.hostname
  image_id = each.value.image_id
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

module "nlb_create" {
  source = "./network_lb"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
  sa_id     = var.sa_id
  
  name      = var.nlb_target_groupname
  subnet_id = "${module.network.subnet_id}"

  providers = {
    yandex.primary = yandex
  }
  
  ipaddr = "${module.vm_create}"
}

