set dotenv-load
set dotenv-filename := ".env.local"

# Default target; show help message
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

# Run the development server
dev:
  pnpm run dev

# Run the production build
build:
  pnpm run compile

# Run the tests
test:
  pnpm run test

# Initialize Terraform
terraform:
  pnpm run tf:init

# Plan Terraform
synth:
  pnpm run tf:plan

# Apply Terraform
deploy:
  pnpm run tf:apply

# Destroy Terraform
destroy:
  pnpm run tf:destroy