terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.69.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "valiant-hangout-310414"
  region  = "us-central1"
  zone    = "us-central1-c"
 }


resource "google_storage_bucket" "static-site" {
  name          = "www.verylazycoders.in"
  location      = "EU"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["www.verylazycoders.in"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}