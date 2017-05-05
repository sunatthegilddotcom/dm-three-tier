#! /bin/bash
apt-get update
apt-get install -y apache2
INSTANCE=$(curl http://metadata.google.internal/computeMetadata/v1/instance/hostname -H "Metadata-Flavor: Google")
IPADDR=$(curl http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/ip -H "Metadata-Flavor: Google")
cat <<EOF > /var/www/html/index.html
<html><body><h2>Hello World</h2>
<h2>I'm running on instance $INSTANCE</h2>
<h2>My internal IP address is $IPADDR</h2>
</body></html>
EOF