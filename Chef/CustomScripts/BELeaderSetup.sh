# Primary BE setup
wget https://packages.chef.io/stable/ubuntu/14.04/chef-backend_1.0.9-1_amd64.deb
dpkg -i chef-backend_1.0.9-1_amd64.deb
echo "publish_address '10.0.0.10'" >> /etc/chef-backend/chef-backend.rb
chef-backend-ctl create-cluster --accept-license --yes --quiet --verbose
curl --upload-file /etc/chef-backend/chef-backend-secrets.json "$1/chef-backend-secrets.json$2" --header "x-ms-blob-type: BlockBlob"
chef-backend-ctl gen-server-config fe0 -f chef-server.rb.fe0
curl --upload-file chef-server.rb.fe0 "$1/chef-server.rb.fe0$2" --header "x-ms-blob-type: BlockBlob"
chef-backend-ctl gen-server-config fe1 -f chef-server.rb.fe1
curl --upload-file chef-server.rb.fe1 "$1/chef-server.rb.fe1$2" --header "x-ms-blob-type: BlockBlob"
chef-backend-ctl gen-server-config fe2 -f chef-server.rb.fe2
curl --upload-file chef-server.rb.fe2 "$1/chef-server.rb.fe2$2" --header "x-ms-blob-type: BlockBlob"