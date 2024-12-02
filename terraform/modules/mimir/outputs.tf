output "app_names" {
  value = merge(
    {
      mimir_s3_integrator = juju_application.s3_integrator.name,
      mimir_coordinator   = module.mimir_coordinator.app_name,
      mimir_read          = module.mimir_read.app_name,
      mimir_write         = module.mimir_write.app_name,
      mimir_backend       = module.mimir_backend.app_name,
    }
  )
}

output "endpoints" {
  value = {
    # Requires
    certificates     = "certificates",
    ingress          = "ingress",
    logging_consumer = "logging-consumer",
    s3               = "s3",
    charm_tracing    = "charm-tracing",

    # Provides
    grafana_dashboards_provider = "grafana-dashboards-provider",
    grafana_source              = "grafana-source",
    mimir_cluster               = "mimir-cluster",
    receive_remote_write        = "receive-remote-write",
    self_metrics_endpoint       = "self-metrics-endpoint",
  }
}

output "bucket_name" {
  value       = var.bucket_name
  description = "The bucket name for Mimir"
}

output "s3_integrator_name" {
  value       = var.s3_integrator_name
  description = "Name of the s3-integrator for Mimir"
}