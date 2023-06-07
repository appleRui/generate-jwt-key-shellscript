#!/bin/bash

# Generate private key
openssl genrsa -out private.pem 2048

# Generate public key
openssl rsa -in private.pem -pubout > public.pem

# Format private key
private_key=$(awk -v ORS='\\n' '1' private.pem)

# Format public key
public_key=$(awk -v ORS='\\n' '1' public.pem)

# Create env file
cat << EOF > .env
PRIVATE_KEY="$private_key"
PUBLIC_KEY="$public_key"
EOF
