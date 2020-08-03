# Creating repository


```console
export GITHUB_ORGANIZATION=
export GITHUB_TOKEN=
```
## Complete name of repo

### file terraform.tfvars
```console
github_organization= "ramiroduarteavalos"
github_token= "xxxxxxxx"
github_repo= "xxxxxx"
github_repo_description= "xxxxxxxx"
```


```console
terraform init
```

```console
terraform apply
```

## Deleting repo
```console
terraform destroy
```


## Id teams
```console
curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/orgs/ramiroduarteavalos/teams
```
