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
    latest_revision = true
  }
}
