terraform {
  required_version = ">= 1.4.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.16.0"
    }
  }
}

# Reference the existing Terraform service account
data "google_service_account" "terraform" {
  account_id = "terraform"
}

provider "google" {
  project = "project-66a29879-9843-4202-83c"
  region  = "us-central1"
}