resource google_compute_instance "nginx_server" {
  name         = var.instance_name
  zone         = var.instance_zone
  machine_type = var.instance_type

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {
      # Allocate a one-to-one NAT IP to the instance
    }
  }
}
resource "google_compute_firewall" "http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080","22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}
