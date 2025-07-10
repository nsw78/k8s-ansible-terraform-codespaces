provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_container_cluster" "primary" {
  name               = "microkube-demo-cluster"
  location           = var.zone
  initial_node_count = 1

  node_config {
    machine_type = "e2-micro" # grátis no free tier
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

output "kubeconfig" {
  value = google_container_cluster.primary.endpoint
}
