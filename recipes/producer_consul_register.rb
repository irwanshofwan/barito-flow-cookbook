#
# Cookbook:: barito-flow
# Recipe:: producer_consul_register
#
# Copyright:: 2018, BaritoLog.
#
#

config = {
  "Node": node['hostname'],
  "Service": {
    "ID": "#{node['hostname']}-barito-receiver",
    "Service": "barito-receiver",
    "Tags": ["app:"],
    "Address": node['ipaddress'],
    "Meta": {
        "http_schema": "http"
    },
    "Port": 8080
  },
  "SkipNodeUpdate": true
}

consul_register_service "barito-receiver" do
  config config
  config_dir  node[cookbook_name]['consul']['config_dir']
  consul_bin  node[cookbook_name]['consul']['bin']
end
