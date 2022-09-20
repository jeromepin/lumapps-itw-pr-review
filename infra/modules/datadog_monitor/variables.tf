variable "query" {
  type        = string
  description = "The query to use in this monitor including time- and space-aggregation, tags, functions and rollups."
}

variable "name" {
  type        = string
  description = "Name of the monitor to create."
}