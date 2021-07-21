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

variable "subnet" {
  type = map(object({
    cidr_block = string  
    region = string 
  }))
}

resource "google_compute_network" "vpc_network" {
  name = "vpc-network-custom"
  auto_create_subnetworks =false
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  for_each=var.subnet
  name          = each.key
  ip_cidr_range = each.value.cidr_block
  region        = each.value.region
  network       = google_compute_network.vpc_network.id 
}
