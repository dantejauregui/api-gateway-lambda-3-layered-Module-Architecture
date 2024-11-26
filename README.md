# Create Terraform Modules in 3-layered Module Architecture

Project architecture:
```sh
.
├── README.md
├── composition
│   └── terraform-remote-backend # <--- Step 3: Create Composition layer and define all the required inputs to Infrastructure module's main.tf
│       └── eu-central-1 
│           └── prod      
│               ├── data.tf
│               ├── main.tf # <----- this is the entry point
│               ├── outputs.tf
│               ├── providers.tf
│               ├── terraform.tfstate
│               ├── terraform.tfstate.backup
│               ├── terraform.tfvars
│               └── variables.tf
├── infrastructure_modules # <---- Step 2: Create Infrastructure Modules (abstraction layer using Facade design pattern) and consume resource modules
│   └── terraform_remote_backend
│       ├── data.tf
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── resource_modules  # <----- Step 1: Replicate remote TF modules in local Resource Modules
    ├── database
    │   └── dynamodb
    │       ├── main.tf
    │       ├── outputs.tf
    │       └── variables.tf
    ├── identity
    │   └── kms_key
    │       ├── main.tf
    │       ├── outputs.tf
    │       └── variables.tf
    └── storage
        └── s3    # <---- replicated locally from remote TF module: https://github.com/terraform-aws-modules/terraform-aws-s3-bucket/blob/master/main.tf
            ├── main.tf      
            ├── outputs.tf
            └── variables.tf
```

# Step 1: Replicate remote TF modules in local Resource Modules


S3: https://github.com/terraform-aws-modules/terraform-aws-s3-bucket

DynamoDB: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table

KMS: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key

and more...


# Step 2: Create Infrastructure Modules and Consume Resource Modules

In [infrastructure_modules/terraform_remote_backend/main.tf](infrastructure_modules/terraform_remote_backend/main.tf), S3 bucket, DynamoDB, and KMS key are defined. 

This `infrastructure_modules/terraform_remote_backend` can be thought of as an __abstraction layer__ which contains all the necessary resources to create Terraform remote backend. 

# Step 3: Create Composition layer and define all the required inputs to Infrastructure module's main.tf


In [composition/terraform-remote-backend/eu-central-1/prod/main.tf](composition/terraform-remote-backend/eu-central-1/prod/main.tf), a single module called `terraform_remote_backend` is defined.

This is kind of thought as main class's main(), which is __kind of calling a constructor method of an interface__ `infrastructure_modules/terraform_remote_backend` which in turn creates terraform remote backend related resources internally.
