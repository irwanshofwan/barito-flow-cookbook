#
# Cookbook:: 
# Recipe:: conformance-checker elasticsearch exporter
#
# Copyright:: 2020, BaritoLog.
#
#

# Create directory
directory node["coch_elasticseach_exporter"]["dir"] do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

# Download coch-elasticsearch-exporter binary & unpack
ark ::File.basename(node["coch_elasticseach_exporter"]["dir"]) do
  url node["coch_elasticseach_exporter"]["binary_url"]
  checksum node["coch_elasticseach_exporter"]["checksum"]
  version node["coch_elasticseach_exporter"]["version"]
  prefix_root Chef::Config["file_cache_path"]
  path ::File.dirname(node["coch_elasticseach_exporter"]["dir"])
  owner 'root'
  group 'root'
  action :put
  notifies :restart, "service[coch_elasticseach_exporter]", :delayed
end

systemd_unit "coch_elasticseach_exporter.service" do
  content <<~END_UNIT
            [Unit]
            Description=Conformance Checker Elastisearch Exporter
            After=network.target

            [Service]
            ExecStart=/bin/bash #{node["postgres_exporter"]["binary"]}
            Restart=on-failure

            [Install]
            WantedBy=default.target
            WantedBy=multi-user.target
          END_UNIT
  action %i(create enable)
  notifies :restart, "service[coch_elasticseach_exporter]", :delayed
end

service "coch_elasticseach_exporter" do
  action %i(enable start)
end