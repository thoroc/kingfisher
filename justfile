set dotenv-load
set dotenv-filename := ".env.local"

# Default backend/target; show help message
default: help

# Show this help message
help:
  just -l

# Shows the current environment variables
env:
  @echo "AWS_REGION            = ${AWS_REGION}"
  @echo "ORGANISATION_NAME     = ${ORGANISATION_NAME}"
  @echo "AWS_ACCESS_KEY_ID     = ${AWS_ACCESS_KEY_ID}"
  @echo "AWS_SECRET_ACCESS_KEY = ${AWS_SECRET_ACCESS_KEY}"

# Install dependencies
dependencies: frontend
  cd backend && pnpm install

# Install frontend dependencies
frontend:
  cd frontend && pnpm install

# Run the development server
dev:
  cd backend && wing it

# Run the production compile
compile:
  cd backend && wing compile --platform tf-aws main.w

# Run the tests
test:
  cd backend && wing test

# Initialize Terraform
terraform-init:
  terraform -chdir=./backend/target/main.tfaws init

# Plan Terraform
plan:
  terraform -chdir=./backend/target/main.tfaws plan

# Apply Terraform
apply:
  terraform -chdir=./backend/target/main.tfaws apply

# Destroy Terraform
destroy:
  terraform -chdir=./backend/target/main.tfaws destroy