#!/bin/bash



export DEBIAN_FRONTEND=noninteractive

echo "Configuring..."

PKI_DIR="/etc/icinga2/pki"

echo "$MASTER_IP $MASTER_HOST" >>/etc/hosts
echo "127.0.2.1 $CLIENT_HOST" >>/etc/hosts

chown nagios.nagios /etc/icinga2 -R

rm -rf /etc/icinga2/conf.d/*


echo "curl -k -s -u $API_USER:$API_PWD -H 'Accept: application/json' -X POST \"https://$MASTER_IP:5665/v1/actions/generate-ticket\" -d '{ \"cn\": \"$CLIENT_HOST\" }'">/opt/ticket.sh

ICINGA_TICKET=`sh /opt/ticket.sh | awk -F\" '{print $12}'`


echo $ICINGA_TICKET





echo "Hello world 3.0"
