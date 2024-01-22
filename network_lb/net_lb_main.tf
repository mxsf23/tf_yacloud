resource "yandex_lb_target_group" "web-srv" {
  name = var.name
  dynamic "target" {
    for_each = [for key, value in var.ipaddr : {
      address = var.ipaddr[key].internal_ip_address[0]
      subnet_id = var.subnet_id
    }]

    content {
      subnet_id = target.value.subnet_id
      address   = target.value.address
    }
  }
}

resource "yandex_lb_network_load_balancer" "nlb-01" {
  name = "nlb-test01"

  listener {
    name = "test-listener01"
    port = 8080
    target_port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.web-srv.id
    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
 