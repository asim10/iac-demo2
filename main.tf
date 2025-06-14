terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.37.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "upgradlabs-1746954675499"
  region  = "asia-south1"
}
