#
# Cookbook:: barito-flow-cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

remote_file '/opt/barito-flow' do
  source 'https://github.com/BaritoLog/barito-flow/releases/download/v0.1.1/barito-flow-linux'
end

template '/etc/init.d/barit-flow.conf' do
  source 'barito-flow.init.config.erb'
end

service 'barito-flow' do
  action [:enable, :start]
end