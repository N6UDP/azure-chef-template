# First FE
wget https://packages.chef.io/stable/ubuntu/14.04/chef-server-core_12.8.0-1_amd64.deb
dpkg -i chef-server-core_12.8.0-1_amd64.deb
curl -o /etc/opscode/chef-server.rb "$1/chef-server.rb.fe0$2"
chef-server-ctl reconfigure
curl --upload-file /etc/opscode/private-chef-secrets.json "$1/private-chef-secrets.json$2" --header "x-ms-blob-type: BlockBlob"
curl --upload-file /etc/opscode/webui_priv.pem "$1/webui_priv.pem$2" --header "x-ms-blob-type: BlockBlob"
curl --upload-file /etc/opscode/webui_pub.pem "$1/webui_pub.pem$2" --header "x-ms-blob-type: BlockBlob"
curl --upload-file /etc/opscode/pivotal.pem "$1/pivotal.pem$2" --header "x-ms-blob-type: BlockBlob"
curl --upload-file /var/opt/opscode/upgrades/migration-level "$1/migration-level$2" --header "x-ms-blob-type: BlockBlob"