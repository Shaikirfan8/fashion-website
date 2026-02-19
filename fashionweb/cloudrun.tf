resource "google_cloud_run_service" "first_cloud_run" {
  name     = "gcp-learning-sv"
  location = "us-central1"
  project  = "project-586cba26-8a19-4658-b23"

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

resource "google_storage_bucket" "gcp-bucket" {
  name          = "gcp-learning-rafiya"
  location      = "US"
  storage_class = "STANDARD"
  force_destroy = true

  uniform_bucket_level_access = false   # 🔥 REQUIRED

  versioning {
    enabled = true
  }
}
