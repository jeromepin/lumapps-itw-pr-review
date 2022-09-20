locals {
  bigquery_admins = [
    "camil@lumapps.com",
    "jan@lumapps.com",
    "julien@lumapps.com",
    "pascal@lumapps.com",
    "adrien@lumapps.com",
  ]

  bigquery_admin_role = "roles/bigquery.admin"

  comparison_operator = ">"
  group-by = ["service"]

  seuil = <<-EOC
  Have a look at the [PostgreSQL dashboard](https://exmaple.com/link/postgresql) to understand what is going on.
  EOC
}

resource "google_project_iam_member" "bigquery_admin" {
  for_each = toset(bigquery_admins)
  role   = local.bigquery_admin_role
  member = "user:julien@lumapps.com"
}

data "aws_ce_tags" "test" {
  time_period {
    start = "2021-01-01"
    end   = "2024-12-01"
  }
}

module "database_cpu" {
  source = "/home/jeanpaul/infra/modules/datadog_monitor"

  name = "Database cpu usage"

  metric              = "database.cpu_percent"
  group_by            = local.group-by
  comparison_operator = local.comparison_operator
  thresholds = {
    warning           = 90
    critical          = 295
  }

  message = local.seuil
}

module "foo" {
  source = "../modules/datadog_monitor"

  name = "Database cpu usage"

  metric              = "database.disk_percent"
  group_by            = local.group-by
  comparison_operator = local.comparison_operator
  thresholds = {
    warning           = 75
    # critical          = 99
    critical          = 90
  }

  message = local.seuil
}