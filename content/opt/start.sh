#!/bin/bash



export DEBIAN_FRONTEND=noninteractive

echo "Configuring..."

PKI_DIR="/etc/icinga2/pki"

echo "$MASTER_IP $MASTER_HOST" >>/etc/hosts
echo "127.0.2.1 $CLIENT_HOST" >>/etc/hosts

chown nagios.nagios /etc/icinga2 -R

rm -rf /etc/icinga2/conf.d/*









echo "Hello world 3.0"
