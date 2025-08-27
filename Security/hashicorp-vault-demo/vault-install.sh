#!/bin/bash
# User-data script to install Vault in dev mode

apt update -y && apt upgrade -y
apt install -y curl gnupg software-properties-common unzip ufw

# Add HashiCorp GPG key & repo
curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list

apt update -y && apt install -y vault

# Open port 8200
ufw allow 8200
ufw allow ssh
ufw --force enable

# Create systemd service for dev Vault
cat <<EOF > /etc/systemd/system/vault-dev.service
[Unit]
Description=Vault Dev Server
After=network.target

[Service]
User=root
# ExecStart=/usr/bin/vault server -dev -dev-root-token-id="root"
ExecStart=/usr/bin/vault server -dev -dev-root-token-id="root" -dev-listen-address="0.0.0.0:8200"
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable vault-dev
systemctl start vault-dev

# Set ENV for root user
echo 'export VAULT_ADDR="http://127.0.0.1:8200"' >> /root/.bashrc
echo 'export VAULT_TOKEN="root"' >> /root/.bashrc

# Log token and status
echo "Vault running at http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):8200" > /var/log/vault-info.txt
echo "Root Token: root" >> /var/log/vault-info.txt
