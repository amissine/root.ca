# 👷 root.ca
The root CA template

[Source](https://jamielinux.com/docs/openssl-certificate-authority/index.html)

## Usage

```bash
cd ~/process
cp -a root.ca gratzio-v2/ca
cd gratzio-v2/ca
./create-root-pair.sh
./create-intermediate-pair.sh

# Create server and client certificates
./create-certificate.sh server_cert qa.gratz.io
./create-certificate.sh usr_cert tester01
./create-certificate.sh usr_cert tester02
```

