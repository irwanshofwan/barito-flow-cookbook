#
# Cookbook:: barito-flow
# Recipe:: producer_restart_service
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
#

service_name = node[cookbook_name]['producer']['service_name']

barito_flow_binary_systemd service_name do
  action :restart
end
