#!/bin/bash

sed -i "s|crt_path|${CERTS_}|g" nginx.conf
sed -i "s|key_path|${KEYS_}|g" nginx.conf