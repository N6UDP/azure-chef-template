# BE Secondary
curl -o chef-backend-secrets.json "$1/chef-backend-secrets.json$2"
wget https://packages.chef.io/stable/ubuntu/14.04/chef-backend_1.0.9-1_amd64.deb
dpkg -i chef-backend_1.0.9-1_amd64.deb
chef-backend-ctl join-cluster 10.0.0.10 -p `ip addr | grep "inet 10" | tr -s ' '  ' ' | cut -d " " -f3 | cut -d"/" -f1` -s chef-backend-secrets.json --accept-license --yes --verbose --quiet
