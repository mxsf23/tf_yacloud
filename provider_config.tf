terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.105.0"
    }
  }
  backend "s3" {
    endpoints   = { 
      s3 = "https://storage.yandexcloud.net"
    }
    bucket     = "sf-tf-state01"
    region     = "ru-central1"
    key        = "lemp.tfstate"
    access_key = "<access_key>"
    secret_key = "<secret_key>"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true 
    skip_s3_checksum  = true
  }

}



provider "yandex" {
  # alias = "primary"
  token = "<ouauth_token>"  
  #token = var.o_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

