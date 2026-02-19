terraform {
  required_version = ">= 1.4.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.16.0"
    }
  }

  backend "gcs" {
    bucket  = "irfan-terraform-state-123"
    prefix  = "fashionweb/state"
  }
}

# Reference the existing Terraform service account
data "google_service_account" "terraform" {
  account_id = "Pipeline"
}

provider "google" {
  project = "project-586cba26-8a19-4658-b23"
  region  = "us-central1"
}
