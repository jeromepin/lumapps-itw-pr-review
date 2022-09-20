locals {
    # us-central1-a => a
    availability_zone = split("-", var.region)[2]
}