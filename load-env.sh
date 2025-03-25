#!/bin/bash

# Enhanced script to load environment variables from .env file
# and validate Forge credentials

if [ ! -f .env ]; then
    echo "❌ No .env file found. Please create one using .env.example as a template."
    exit 1
fi

# Load all variables from .env
echo "📝 Loading environment variables from .env file..."
set -a
source .env
set +a

# Determine which set of credentials to use
if [ -n "$FORGE_DEV_EMAIL" ] && [ -n "$FORGE_DEV_TOKEN" ]; then
    echo "🔧 Development credentials found (FORGE_DEV_EMAIL)."
    export FORGE_EMAIL="$FORGE_DEV_EMAIL"
    export FORGE_API_TOKEN="$FORGE_DEV_TOKEN"
    echo "🚀 Using DEVELOPMENT credentials for Forge operations."
elif [ -n "$FORGE_EMAIL" ] && [ -n "$FORGE_API_TOKEN" ]; then
    echo "🔑 Production credentials found (FORGE_EMAIL)."
    echo "🚀 Using PRODUCTION credentials for Forge operations."
else
    echo "❌ No valid Forge credentials found in .env file."
    echo "Please ensure either FORGE_DEV_EMAIL + FORGE_DEV_TOKEN or FORGE_EMAIL + FORGE_API_TOKEN are set."
    exit 1
fi

# Debug mode notification
if [ "$DEBUG" = "true" ]; then
    echo "🐞 Debug mode is ENABLED."
fi

echo "✅ Environment setup complete."