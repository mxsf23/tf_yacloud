resource "yandex_iam_service_account_static_access_key" "mvsa-static-key" {
  service_account_id = var.sa_id
  description        = "static access key for object storage"
}

resource "yandex_storage_bucket" "test_bucket" {
  bucket     = "bucket-test01"
  access_key = yandex_iam_service_account_static_access_key.mvsa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.mvsa-static-key.secret_key
  versioning {
    enabled = true
  }
   lifecycle_rule {
    enabled = true
    noncurrent_version_expiration {
      days = 10
    }
   }
  max_size   = 10485760
}

output "bucket_name" {
   value = yandex_storage_bucket.test_bucket.bucket
 }