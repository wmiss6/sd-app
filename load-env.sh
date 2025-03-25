#!/bin/bash

# Simple script to load environment variables from .env file

if [ -f .env ]; then
    echo "Loading environment variables from .env file..."
    set -a
    source .env
    set +a
    echo "Environment variables loaded."
else
    echo "No .env file found. Please create one using .env.example as a template."
    exit 1
fi
