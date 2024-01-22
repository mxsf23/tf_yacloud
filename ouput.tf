output "internal_ip_address" {
  value = { for vm_key, vm_value in ("${module.vm_create}") :
    vm_key => "${module.vm_create[vm_key].internal_ip_address}"   
  }
  description = "Virtual machine intrernal IP-address"
}

output "external_ip_address" {
  value = { for vm_key, vm_value in ("${module.vm_create}") :
    vm_key => "${module.vm_create[vm_key].external_ip_address}"   
  }
  description = "Virtual machine extrernal IP-address"
}

output "network_load_balancer_listener" {
  value = "${module.nlb_create.*}"
  description = "Network Load Balancer listener parameters - ipaddr, ports and so on"
}
