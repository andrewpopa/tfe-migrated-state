terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "popa-org"

    workspaces {
      name = "pet-state"
    }
  }
}

resource "random_pet" "pet" {}
