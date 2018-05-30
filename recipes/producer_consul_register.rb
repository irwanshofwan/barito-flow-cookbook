#
# Cookbook:: barito-flow
# Recipe:: producer_consul_register
#
# Copyright:: 2018, BaritoLog.
#
#

config = {
  "id": "#{node['hostname']}-barito-receiver",
  "name": "barito-receiver",
  "tags": ["app:"],
  "address": node['ipaddress'],
  "port": 8080,
  "meta": {
    "http_schema": "http"
  }
}

consul_register_service "barito-receiver" do
  config config
  config_dir  node[cookbook_name]['consul']['config_dir']
  consul_bin  node[cookbook_name]['consul']['bin']
end
