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

resource "google_compute_network" "vpc_network" {
  name = "vpc-network3"
}

output "op_id" {
  value = google_compute_network.vpc_network.id
}

output "op_self_link" {
  value = google_compute_network.vpc_network.self_link 
}