resource "google_compute_network" "default" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  project                 = var.project_id
}

resource "google_compute_subnetwork" "default" {
  name                     = var.subnetwork_name
  ip_cidr_range            = var.subnet_cidr
  region                   = var.region
  project                  = var.project_id
  network                  = google_compute_network.default.name
  private_ip_google_access = true
}

data "google_client_openid_userinfo" "me" {
}

resource "google_os_login_ssh_public_key" "default" {
  user = data.google_client_openid_userinfo.me.email
  key  = file("/home/hot/.ssh/id_rsa.pub") # path/to/ssl/id_rsa.pub
}
