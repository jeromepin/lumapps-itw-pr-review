resource "google_project_iam_member" "bigquery_data_editor" {
  for_each = toset([
    "alice@lumapps.com",
    "bob@lumapps.com",
  ])
  role   = "roles/bigquery.dataEditor"
  member = "user:${each.key}"
}

resource "google_project_iam_member" "bigquery_user" {
  for_each = toset([
    "jerome@lumapps.com",
  ])
  role   = "roles/bigquery.user"
  member = "user:${each.key}"
}