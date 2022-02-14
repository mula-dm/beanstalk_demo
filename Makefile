usage:
	@echo "Available commands: "
	@echo
	@echo ===================
	@echo "\t\033[92mhelp\033[0m - Show help."
	@echo "\t\033[92minit\033[0m - Terraform init."
	@echo "\t\033[92mplan\033[0m - Terraform plan."
	@echo "\t\033[92mapply\033[0m - Terraform apply."
	@echo "\t\033[92mdestroy\033[0m - Terraform destroy."
	@echo ===================
	@echo

# ---------------------------------------------------------------------------------------------------------------------
# Variables
# ---------------------------------------------------------------------------------------------------------------------

TERRAFORM_VERSION ?= latest
TERRAFORM_IMAGE ?= hashicorp/terraform
TERRAFORM ?= @docker run --rm  -i -t -v ~/.aws:/root/.aws --mount type=bind,source="$$(pwd)",target=/terraform -w /terraform ${TERRAFORM_IMAGE}:${TERRAFORM_VERSION}

# ---------------------------------------------------------------------------------------------------------------------
# Targets
# ---------------------------------------------------------------------------------------------------------------------

.PHONY: usage
.PHONY: help
help: usage

.PHONY: init
init:
	${TERRAFORM} init

.PHONY: plan
plan:
	${TERRAFORM} plan

.PHONY: apply
apply:
	${TERRAFORM} apply

.PHONY: destroy
destroy:
	${TERRAFORM} destroy
