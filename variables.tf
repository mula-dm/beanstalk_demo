variable "name" {
  type    = string
  default = "demo"
}

locals {
  tags = {
    "Project"    = var.name
    "Created_By" = "Terraform"
    "Notes"      = "Do_not_edit_it_manually"
  }
}
