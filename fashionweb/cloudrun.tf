resource "google_cloud_run_service" "first_cloud_run" {
  name     = "irfan-cloudrun"
  location = "us-central1"
  project  = "project-66a29879-9843-4202-83c"

  template {
    spec {
      service_account_name = data.google_service_account.terraform.email
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = false
  }
}

resource "google_storage_bucket" "irfan_bucket" {
  name          = "irfan-123"
  location      = "US"
  storage_class = "STANDARD"
  force_destroy = true

  uniform_bucket_level_access = true   # 🔥 REQUIRED

  versioning {
    enabled = true
  }
}