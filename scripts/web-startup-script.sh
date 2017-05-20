#! /bin/bash
apt-get update
apt-get install -y apache2
INSTANCE=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/hostname)
IPADDR=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/ip)
COLOR=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/attributes/color)
cat <<EOF > /var/www/html/index.html
<html>
<body style="background-color:$COLOR; color:white">
<h2>Hello World</h2>
<h2>I'm running on instance $INSTANCE</h2>
<h2>My internal IP address is $IPADDR</h2>
</body>
</html>
EOF
