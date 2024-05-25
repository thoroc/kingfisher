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
  cd session-manager && pnpm run dev

# Run the production compile for session-manager
compile-session-manager:
  cd session-manager && pnpm run compile

# Run the tests in session-manager
test-session-manager:
  cd session-manager && pnpm run test

# Initialize Terraform in session-manager
terraform-init-session-manager:
  cd session-manager && pnpm run tf:init

# Plan Terraform in session-manager
plan-session-manager:
  cd session-manager && pnpm run tf:plan

# Apply Terraform in session-manager
deploy-session-manager:
  cd session-manager && pnpm run tf:apply

# Destroy Terraform in session-manager
destroy-session-manager:
  cd session-manager && pnpm run tf:destroy