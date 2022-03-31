# terraform-ovhcloud-hosting-privatedatabase

Manage your OVHcloud privateSQL databases as code with Terraform:

- order an instance
  - mariadb
  - mysql
  - postgresql
  - redis
- create databases
- create users
- manage grants
- Whitelist IP address to restrict access to your instance (sftp or service port)

If your instance was ordered manually from the OVHCloud control panel, a datasource will allow you to manage your privateSQL the same way you ordered it "as code".

Read the Terraform registry [documentation](https://registry.terraform.io/providers/ovh/ovh/latest/docs)

# How it works

## Requirements

- [terraform](https://www.terraform.io/downloads) binary
- An [OVHCloud](https://www.ovhcloud.com/) account
- A private [APIv6](https://www.ovh.com/auth/createToken/?GET=/order/*&PUT=/order/*&POST=/order/*&DELETE=/order/*&GET=/me/order/*&PUT=/me/order/*&POST=/me/order/*&DELETE=/me/order/*&GET=/me/notification/email/history/&GET=/me/notification/email/history&GET=/hosting/privateDatabase/*&POST=/hosting/privateDatabase/*&PUT=/hosting/privateDatabase/*&DELETE=/hosting/privateDatabase/*) tokens

- A billing account (or your admin account). This account has rights to order privateSQL instances.
- A technical account. This one will be able to manage your privateSQL and will not be able to terminate your service.

## Let's play with mariadb

### Initialize your workspace

First your need to export your OVHCloud APIv6 variables then initialize your environnement:

```sh
cd env/mariadb
terraform init
```

- Create a custom `variables.tfvars` file to add your configuration.

```hcl
order = {
  name         = "terraform-mariadb"
  tech_account = "nictec-instanceid"
  plan_code    = "private-sql-512-instance"
  datacenter   = "gra3"
  engine       = "mariadb_10.3"
}

databases = [
  "admin",
]

users = [{
    name     = "admin"
    password = "changeme"
  }
]

grants = [{
    database = "admin"
    user     = "admin"
    grant    = "admin"
  }
]

whitelists = [{
    ip      = "1.2.3.4"
    name    = "My personal public IP address"
    service = true
    sftp    = true
  }
]
```

#### Required arguments

The following arguments are required:

* `order` - Order details
    * `name` - Name of your instance displayed on the OVHcloud Control Panel
    * `tech_account` - Use a technical account instead of your admin/billing account to manage your instance
    * `plan_code` - Plan code. Values can be `private-sql-512-instance`, `private-sql-1024-instance`, `private-sql-2048-instance`, `private-sql-4096-instance`
    * `datacenter` - OVHCloud datacenter. Values can be `gra3` (better than `gra1` or `gra2` for network considerations) or `bhs1`
    * `engine` - Database engine. Values can be
        * `mariadb_10.2`
        * `mariadb_10.3`
        * `mariadb_10.4`
        * `mariadb_10.5`
        * `mysql_5.7`
        * `mysql_8.0`
        * `postgresql_9.5`
        * `postgresql_9.6`
        * `postgresql_10`
        * `postgresql_11`
        * `postgresql_12`
        * `redis_6.0`

* `databases` - A list of string
* `users` - a list of objects
* `grants` - a list of objects. Grants value can be `admin`, `ro`, `rw`
* `whitelists` - a list of objects

### Speculative plan

Then, check the terraform speculative plan:

```sh
terraform plan -var-file=variables.tfvars
```

### Apply changes

If no errors let's deploy our instance and configurations in one terraform run:

```sh
terraform apply -var-file=variables.tfvars
```

# Limitations

## Redis

For now APIv6 only allow us to handle whitelists.

Databases, users, grants are not available. We cannot update user's password once the instance is deployed.

You will need to change it from the OVHCloud control panel
