# Creating repository


```console
export GITHUB_ORGANIZATION=
export GITHUB_TOKEN=
```
## Complete name of repo

### file terraform.tfvars
```console
github_organization= "xxxxx"
github_token= "xxxxxxxx"
github_repo= "xxxxxx"
github_repo_description= "xxxxxxxx"
```


```console
terraform init
```

### If you need?
```console
terraform plan -var github_repo="terraform-module-template" -var-file="../terraform.tfvars"
```

```console
terraform apply -var github_repo="terraform-module-template" -var-file="../terraform.tfvars" -auto-approve
```

## Deleting repo
```console
terraform destroy
```


## Id teams
```console
curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/orgs/xxxxx/teams
```
