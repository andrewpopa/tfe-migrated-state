# tfe-migrated-state
TFE project with migrated state from different project

# Pre-requisites

- install [git](https://git-scm.com/downloads)
- install [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [TFE](https://www.terraform.io/docs/enterprise/index.html)

# use case
You need to split one repo with multiple resources created into 2 separate repos.

### 1 repo

`main.tf`

```bash
resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo Hello world!"
  }
}

resource "random_pet" "pet" {}
```

`$ terraform show`

```
null_resource.example:
  id = 6473645719479866000
random_pet.pet:
  id = obliging-mite
  length = 2
  separator = -`
```

you want to move your random pet in separate repo and migrate to TFE

```bash
terraform state mv -state-out=../<your-second-repo>/terraform.tfstate random_pet.pet random_pet.pet
```

### 2 repo

- create workspace in TFE
- make sure you have same TF version
- link workspace to github repo
- update the code reference, push the code to github
- when you do `terraform apply` you don't have any resource to add
- when you run `terraform destroy` you have 1 resource to destroy

Enjoy