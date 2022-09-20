locals {
    message = "${var.message}\n${var.destination_channel}"
    query = "${var.query} ${var.comparison_operator} ${var.thresholds.critical}"
}