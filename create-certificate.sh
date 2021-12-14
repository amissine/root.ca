#!/usr/bin/env bash

# Create the key
openssl genrsa -out intermediate/private/${2}.key.pem 2048
chmod 400 intermediate/private/${2}.key.pem

# Create the CSR
openssl req -config intermediate/openssl.cnf \
      -key intermediate/private/${2}.key.pem \
      -new -sha256 -out intermediate/csr/${2}.csr.pem

# Create the server certificate 
openssl ca -config intermediate/openssl.cnf \
      -extensions $1 -days 375 -notext -md sha256 \
      -in intermediate/csr/${2}.csr.pem \
      -out intermediate/certs/${2}.cert.pem
chmod 444 intermediate/certs/${2}.cert.pem

# Verify the certificate
openssl x509 -noout -text \
      -in intermediate/certs/${2}.cert.pem
openssl verify -CAfile intermediate/certs/ca-chain.cert.pem \
      intermediate/certs/${2}.cert.pem

# Deploy the certificate:
# - https://jamielinux.com/docs/openssl-certificate-authority/sign-server-and-client-certificates.html
