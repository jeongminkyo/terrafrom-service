### Onul_VPC

-----------



### Spec

cidr : "10.10.0.0/16"

public_subnet : "10.10.1.0/24", "10.10.2.0/24"

private_subnet : "10.10.101.0/24", "10.10.102.0/24"

db_subnet : "10.10.103.0/24", "10.10.104.0/24"

provider : aws "~> 3.10.0"

region  = "ap-northeast-2"



### Usage

```
$ terraform plan -out=plan

$ terraform apply plan

$ terraform destory -target module.rds
```

