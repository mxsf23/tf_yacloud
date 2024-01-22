data "yandex_compute_image" "lemp" {
  family = "lemp"
}

data "yandex_compute_image" "lamp" {
  family = "lamp"
}

locals { 
  vms = {
    "vm-01" = {
        hostname                = "lemp-instance01"
        image_id                = "${data.yandex_compute_image.lemp.id}"
        },
    "vm-02" = {
        hostname                = "lemp-instance02"
        image_id                = "${data.yandex_compute_image.lamp.id}"
        }
    }
}
