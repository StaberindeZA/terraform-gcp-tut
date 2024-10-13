# Create service account for vm
resource "google_service_account" "default" {
  project      = var.project_id
  account_id   = "${var.prefix}-medium-vm-sa"
  display_name = "VM SA"
}

# VM config 
resource "google_compute_instance" "default" {
  name                      = "medium-vm"
  project                   = var.project_id
  machine_type              = var.vm_machine_type
  zone                      = var.zone
  tags                      = ["ssh"]
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      type  = "pd-ssd"
      size  = 100
    }
  }

  # network config
  network_interface {
    network            = var.vpc_name
    subnetwork         = var.subnetwork_name
    subnetwork_project = var.project_id
  }

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
