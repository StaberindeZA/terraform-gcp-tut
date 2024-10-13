resource "google_storage_bucket" "remote-backend" {
  project                     = var.project_id
  name                        = var.tfstate_bucket_name
  uniform_bucket_level_access = true
  location                    = var.region

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_member" "remote" {
  bucket = google_storage_bucket.remote-backend.name
  role   = "roles/storage.admin"
  member = "serviceAccount:gcp-tut-svc@terraform-tutorials-438512.iam.gserviceaccount.com"
}
