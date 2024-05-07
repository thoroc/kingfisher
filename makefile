-include Makefile-lib.mk

.PHONY: all install test_core build_core update \
	test_adapters test_local test_remote compile \
	tf_init deploy destroy


.DEFAULT_GOAL := help

all: test_remote

# Node Package Manager
npm:
	@if ! command -v pnpm &> /dev/null; then \
		echo "Node Package Manager is not installed. Please visit https://nodejs.org/en/download/ to download and install Node.js."; \
	fi

# Install the dependencies
install: npm
	$(NPM) install

# Test the Core library
test_core: install
	$(NPM) run test

# Build the Core library
build_core: test_core
	$(NPM) run build

# Update the Wing CLI
update:
	$(NPM) update -g wing

# Run the local environment
run_local: build_core
	$(WING) it main.w

# Test the adapters
test_adapters: update
	$(WING) test test.adapters.main.w -t sim

# Test the local environment
test_local: build_core test_adapters
	$(WING) test test.main.w -t sim

# Test the remote environment
test_remote: test_local
	$(WING) test test.main.w -t tf-$(CLOUD)

# Compile the Wing script
compile:
	$(WING) compile main.w -t tf-$(CLOUD)

# Check if Terraform is installed
terraform:
	@if ! command -v terraform &> /dev/null; then \
		echo "Terraform is not installed. Please visit https://www.terraform.io/downloads.html to download and install Terraform."; \
	fi

# Initialize Terraform
tf_init: terraform compile
	( \
		cd $(TARGET) ;\
		terraform init \
	)

# Deploy the infrastructure
deploy: terraform tf_init
	( \
		cd $(TARGET) ;\
		terraform apply -auto-approve \
	)

# Destroy the infrastructure
destroy: terraform
	( \
		cd $(TARGET) ;\
		terraform destroy -auto-approve \
	)