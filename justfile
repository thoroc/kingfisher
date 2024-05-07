set shell := ["zsh", "-uc"]

# all: test_remote

# Check if we have a pnpm-lock.yaml file or a yarn.lock file or a package-lock.json file
# If we have a pnpm-lock.yaml file, we are using pnpm
# If we have a yarn.lock file, we are using yarn
# If we have a package-lock.json file, we are using npm
# If we have none of the above, we are using npm
# NPM := if path_exists("pnpm-lock.yaml") == true {
# 	"pnpm"
# } else if path_exists("yarn.lock") == true {
# 	"yarn"
# } else if path_exists("package-lock.json") == true {
# 	"npm"
# } else {
# 	"npm"
# }

NPM := $(shell if [ -f "pnpm-lock.yaml" ]; then echo "pnpm"; \
    elif [ -f "yarn.lock" ]; then echo "yarn"; \
    elif [ -f "package-lock.json" ]; then echo "npm"; \
    else echo "npm"; \
    fi)



hello world:
	@echo "Hello, {{world}}!"
	@echo "path_exists('pnpm-lock.yaml') = {{path_exists('pnpm-lock.yaml')}}"
	@echo "NPM={{NPM}}"

# We are assuming to be using zsh
PNPM := `which pnpm`
PNPM_VERSION := '{{PNPM}} --version'

WING := `which wing`
CLOUD := 'aws'
TARGET := 'target/main.tf{{CLOUD}}'

# Node Package Manager
npm:
	@if ! command -v npm &> /dev/null; then \
		echo "Node Package Manager is not installed. Please visit https://nodejs.org/en/download/ to download and install Node.js."; \
	fi

# Performance Node Package Manager
# echo "PNPM is not installed. Please visit https://pnpm.io/installation to download and install PNPM."
# pnpm: 
# 	if ( ! command -v pnpm &> /dev/null ) { 
# 		echo "foo" 
# 	} else { 
# 		echo "bar" 
# 	}

# Install the dependencies
install: npm
	{{PNPM}} install

# Test the Core library
test_core: install
	{{PNPM}} run test

# Build the Core library
build_core: test_core
	{{PNPM}} run build

# Update the Wing CLI
update:
	{{PNPM}} update -g wing

# Run the local environment
run_local: build_core
	{{WING}} it main.w

# Test the adapters
test_adapters: update
	{{WING}} test test.adapters.main.w -t sim

# Test the local environment
test_local: build_core test_adapters
	{{WING}} test test.main.w -t sim

# Test the remote environment
test_remote: test_local
	{{WING}} test test.main.w -t tf-{{CLOUD}}

# Compile the Wing script
compile:
	{{WING}} compile main.w -t tf-{{CLOUD}}

# Check if Terraform is installed
terraform:
	@if ! command -v terraform &> /dev/null; then \
		echo "Terraform is not installed. Please visit https://www.terraform.io/downloads.html to download and install Terraform."; \
	fi

# Initialize Terraform
tf_init: terraform compile
	( \
		cd {{TARGET}} ;\
		terraform init \
	)

# Deploy the infrastructure
deploy: terraform tf_init
	( \
		cd {{TARGET}} ;\
		terraform apply -auto-approve \
	)

# Destroy the infrastructure
destroy: terraform
	( \
		cd {{TARGET}} ;\
		terraform destroy -auto-approve \
	)