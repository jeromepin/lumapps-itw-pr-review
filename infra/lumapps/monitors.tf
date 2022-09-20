module "database_memory_monitor" {
  source = "../modules/datadog_monitor"

  name = "Database memory usage"

  metric              = "database.memory_percent"
  group_by            = ["service"]
  comparison_operator = ">"
  thresholds = {
    warning           = 90
    critical          = 95
  }

  message = <<-EOC
  Have a look at the [PostgreSQL dashboard](https://exmaple.com/link/postgresql) to understand what is going on.
  EOC
}