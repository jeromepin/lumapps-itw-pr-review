resource "datadog_monitor" "common_monitor" {
  name    = var.name
  type    = "metric alert"
  message = local.message

  query = local.query

  monitor_thresholds {
    warning           = try(var.thresholds.warning, null)
    warning_recovery  = null
    critical          = var.thresholds.critical
    critical_recovery = null
  }

  tags = concat(["created-by:terraform"], var.additional_resource_tags)
}

resource "datadog_downtime" "common_monitor_mute" {
  count      = datadog_monitor.common_monitor.priority > 2 ? 1 : 0
  scope      = ["*"]
  monitor_id = datadog_monitor.common_monitor.id
}