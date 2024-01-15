# Install haproxy
sudo apt install haproxy
# Generate a self-signed cert for haproxy located at /etc/haproxy/ssl/my_cert.pem
mkdir /etc/haproxy/ssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/haproxy/ssl/my_cert.pem -out /etc/haproxy/ssl/my_cert.pem
  # input information as prompted
# Update the haproxy.cfg file located at /etc/haproxy/haproxy.cfg
chown ubuntu /etc/haproxy/haproxy.cfg
  # update haproxy.cfg with the contents of haproxy.cfg in this directory
chown root /etc/haproxy/haproxy.cfg
service haproxy reload
