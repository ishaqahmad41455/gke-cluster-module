resource "google_container_node_pool" "node_pool" {
  depends_on = [google_container_cluster.primary]
  name       = var.pool_name
  cluster    = var.cluster_name
  node_count = var.node_count

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  node_config {
    preemptible   = var.preemptible
    machine_type  = var.machine_type

    labels = {
      role = var.role_label
    }

    taint {
      key    = var.taint_key
      value  = var.taint_value
      effect = var.taint_effect
    }

    service_account = var.service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
