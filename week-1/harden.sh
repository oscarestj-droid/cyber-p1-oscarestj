#!/bin/bash
# T1-M1-S02: SECURITY HARDENING AUTOMATION

# 1. Secure the Vault Directory (User: R/W/X, others: none)
chmod 700 ~/Vault

# 2. Secure the Secrets file (User: R/W, others: none)
chmod 600 ~/Vault/secrets.txt

# 3. Secure the System Shadow file
sudo chmod 640 /etc/shadow
sudo chown root:shadow /etc/shadow


