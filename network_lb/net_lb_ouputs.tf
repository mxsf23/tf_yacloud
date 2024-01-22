output "target_group_id" {
  value = yandex_lb_target_group.web-srv.id
}

output "nlb_ip_address" {
  value = yandex_lb_network_load_balancer.nlb-01.listener
}