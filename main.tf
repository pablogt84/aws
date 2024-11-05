provider "google" {
    credentials = file(var.gcp_svc_key)
    project = var.gcp_project
    region = var.gcp_region


}




resource "google_compute_instance" "mi-vm" {
  name         = "mi-vm2"
  machine_type = "e2-micro"  # Define el tipo de máquina
  zone         = "us-central1-a"  # Define la zona

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"  # Imagen del sistema operativo
    }
  }

  network_interface {
    network    = "default"
    subnetwork = "default"

    access_config {
      # Asigna una IP pública
    }
  }
}


