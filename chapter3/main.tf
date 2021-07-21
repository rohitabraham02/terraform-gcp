terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.69.0"
    }
  }
}

provider "google" {
  project = "valiant-hangout-310414"
  region  = "us-central1"
  zone    = "us-central1-c"
  }

provider "google" {
  alias  = "europe-west1"
  project = "valiant-hangout-310414"
  region  = "europe-west1"
  zone    = "europe-west1-c"
  }



data "google_compute_network" "my-network" {
  name = "vpc-network-custom"
}
  


resource "google_compute_instance" "vm_instance" {
  provider =     google.europe-west1  
  name         = "terraform-instance"
  machine_type = "f1-micro"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = data.google_compute_network.my-network.self_link 
    subnetwork = data.google_compute_network.my-network.subnetworks_self_links[1]
    access_config {
    }
  }

}


 