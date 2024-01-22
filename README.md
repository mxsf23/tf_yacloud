## Description

Some Terraform tests with Yandex Cloud

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.105.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.105.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network"></a> [network](#module\_network) | ./network | n/a |
| <a name="module_nlb_create"></a> [nlb\_create](#module\_nlb\_create) | ./network_lb | n/a |
| <a name="module_s3_storage_config"></a> [s3\_storage\_config](#module\_s3\_storage\_config) | ./storage | n/a |
| <a name="module_vm_create"></a> [vm\_create](#module\_vm\_create) | ./vm | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_compute_image.lamp](https://registry.terraform.io/providers/yandex-cloud/yandex/0.105.0/docs/data-sources/compute_image) | data source |
| [yandex_compute_image.lemp](https://registry.terraform.io/providers/yandex-cloud/yandex/0.105.0/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Access key for S3 Storage | `string` | n/a | yes |
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | Cloud ID | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Account folder ID | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Private network name | `string` | `"network1"` | no |
| <a name="input_nlb_target_groupname"></a> [nlb\_target\_groupname](#input\_nlb\_target\_groupname) | Target VM group name for Network Load Balancer | `string` | `"web-vms-01"` | no |
| <a name="input_sa_id"></a> [sa\_id](#input\_sa\_id) | Service Account ID | `string` | n/a | yes |
| <a name="input_secgroup_id"></a> [secgroup\_id](#input\_secgroup\_id) | Security group ID. This variable doesn't apply to anything. Used as a mark for furture. It's always Default yet. | `string` | `"default"` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Secret key for S3 Storage | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Private subnet name | `string` | `"subnet1"` | no |
| <a name="input_v4_cidr_blocks"></a> [v4\_cidr\_blocks](#input\_v4\_cidr\_blocks) | IPv4 network for private subnet | `list (string)` | <pre>[<br>  "192.168.20.0/24"<br>]</pre> | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Cloud Zone name | `string` | `"ru-central1-a"` | no |

## Locals

Some VM parameters. See locals.tf for example and possible values. 

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address"></a> [external\_ip\_address](#output\_external\_ip\_address) | Virtual machine extrernal IP-address |
| <a name="output_internal_ip_address"></a> [internal\_ip\_address](#output\_internal\_ip\_address) | Virtual machine intrernal IP-address |
| <a name="output_network_load_balancer_listener"></a> [network\_load\_balancer\_listener](#output\_network\_load\_balancer\_listener) | Network Load Balancer listener parameters - ipaddr, ports and so on |
