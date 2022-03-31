# Migrate your Web cloud databases to IaC

- Someone already ordered your Web cloud database instance
- Your instance is in production
- Many databases/users/grants/whitelists are already created

In this situation, what you need to do is to mirror the instance configuration.

`variables.tfvars` needs to be created/updated to match variables requirements.

Once your tfvars file is containing what's needed, you can import resources.

## Import resources created manually

```
terraform import -var-file=variables.tfvars module.database[0].ovh_hosting_privatedatabase_database.database <nictec-serviceid>/admin

terraform import -var-file=variables.tfvars module.user[0].ovh_hosting_privatedatabase_user.user <nictec-serviceid>/admin

terraform import -var-file=variables.tfvars module.grant[0].ovh_hosting_privatedatabase_user_grant.grant <nictec-serviceid>/admin/admin/admin

terraform import -var-file=variables.tfvars module.whitelist[0].ovh_hosting_privatedatabase_whitelist.whitelist <nictec-serviceid>/1.2.3.4
```

## Remove resources from state file

In case of errors, you may need to clean your state file and start over again until your terraform configuration match what was configured upstream.

```
terraform state rm module.database module.user module.grant module.whitelist
```
