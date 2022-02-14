Demo Project
==============================

Summary
---------
This repo contains configuration files for the spin up AWS Elastic Beanstalk environment from scratch on AWS.

Documentation
-------------

Software Versions
---------
ubuntu: > 21.04
docker
awscli

Directory structure
-------------------
    .
    ├── terraform        	# terraform scripts for spin up env on aws
    ├── Makefile          	# Makefile that helps build/spinup/update/delete env (see "make help")
    └── README.md

Install steps
-------------------
# Requirements

0.0: This scrip currently tested only on ubuntu 21.04!

0.1: For spin up, env we need fresh AWS account and installed/configured AWS CLI
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
For do this first we neeed create IAM User in aws console.

# NOTE This script using aws credentials from $USER/.aws/ directory!!!

0.2:
Also we need to have installed "make" and "docker" on the host

```sh
sudo apt-get update
sudo apt-get install make
````

0.3:
For docker installation please read the official docs 
https://docs.docker.com/engine/install/ubuntu/

1: Clone repo to local env

```sh
git clone git@github.com:mula-dm/aws_demo.git
```

2: Before starting, we need to create AWS S3 bucket fot terraform tfstate with some unique bucket name 

```sh
aws s3api create-bucket --bucket SOME_UNIQUE_NAME  --region us-east-1
```
3: Create backend_override.tf

```sh
cp backend_override.tf.example backend_override.tf
```
And edit this file.
Namely, you need to specify your bucket name from the previous step.


3: Prepare terraform and custom scripts

```sh
make init
```

4: Run terraform plan

```sh
make tf_plan
```

5: Run terraform apply and confirm the terraform action (type: yes) 

```sh
make tf_apply
```

6: After this, we have to wait until the terraform roll out the stack.
It takes approximately 5 minutes
