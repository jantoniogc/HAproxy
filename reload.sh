docker inspect --format '{{.Name}} {{.NetworkSettings.IPAddress}}:8997 check' $(docker ps | grep libreoffice | cut -f 1,3 -d ' ') | sed -r -e 's/\//  server /g' > /tmp/servers.txt
cat /etc/haproxy/haproxy_default.cfg /tmp/servers.txt > /etc/haproxy/haproxy.cfg
