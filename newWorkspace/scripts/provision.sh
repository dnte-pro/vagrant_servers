#!/usr/bin/env bash
set -e

sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y curl nginx

TOOLPLATE_INSTALLER_URL="https://www.tooplate.com/zip-templates/2106_soft_landing.zip"
INSTALLER_PATH="/tmp/2106_soft_landing.zip"

echo "Downloading Toolplate setup from ${TOOLPLATE_INSTALLER_URL}..."
curl -fsSL "${TOOLPLATE_INSTALLER_URL}" -o "${INSTALLER_PATH}"

echo "Running Toolplate setup..."
sudo unzip "${INSTALLER_PATH}" -d /var/www/html/

sudo rm -f "${INSTALLER_PATH}"
sudo systemctl enable httpd
sudo systemctl restart httpd

echo "Provisioning complete."
