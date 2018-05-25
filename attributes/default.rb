#
# Cookbook:: barito-flow
# Attribute:: default
#
# Copyright:: 2018, BaritoLog.
#
#

cookbook_name = 'barito-flow'

# User and group of service process
default[cookbook_name]['user'] = 'barito'
default[cookbook_name]['group'] = 'barito'

# Temp directory
default[cookbook_name]['prefix_temp'] = '/var/cache/chef'
# Installation directory
default[cookbook_name]['prefix_root'] = '/opt'
# Where to link binaries
default[cookbook_name]['prefix_bin'] = '/opt/bin'

#
# Producer
#

# producer version
default[cookbook_name]['producer']['version'] = 'v0.1.2'
producer_version = node[cookbook_name]['producer']['version']

# where to get the binary
default[cookbook_name]['producer']['binary'] = 'barito-flow-linux'
producer_binary = node[cookbook_name]['producer']['binary']
default[cookbook_name]['producer']['mirror'] =
  "https://github.com/BaritoLog/barito-flow/releases/download/#{producer_version}/#{producer_binary}"
default[cookbook_name]['producer']['service_name'] = 'barito-flow-producer'

# environment variables
default[cookbook_name]['producer']['prefix_env_vars'] = '/etc/default'
default[cookbook_name]['producer']['env_vars_file'] = "#{node[cookbook_name]['producer']['prefix_env_vars']}/#{node[cookbook_name]['producer']['service_name']}"
default[cookbook_name]['producer']['env_vars'] = {}

# producer daemon options, used to create the ExecStart option in service
default[cookbook_name]['producer']['cli_opts'] = ['r']

# log file location
default[cookbook_name]['producer']['prefix_log'] = '/var/log/barito-flow-producer'
default[cookbook_name]['producer']['log_file_name'] = 'error.log'

# producer Systemd service unit, include config
default[cookbook_name]['producer']['systemd_unit'] = {
  'Unit' => {
    'Description' => 'barito producer',
    'After' => 'network.target'
  },
  'Service' => {
    'Type' => 'simple',
    'User' => node[cookbook_name]['user'],
    'Group' => node[cookbook_name]['group'],
    'Restart' => 'on-failure',
    'RestartSec' => 2,
    'StartLimitInterval' => 50,
    'StartLimitBurst' => 10,
    'ExecStart' => 'TO_BE_COMPLETED'
  },
  'Install' => {
    'WantedBy' => 'multi-user.target'
  }
}

#
# Consumer
#

# consumer version
default[cookbook_name]['consumer']['version'] = 'v0.1.2'
consumer_version = node[cookbook_name]['consumer']['version']

# where to get the binary
default[cookbook_name]['consumer']['binary'] = 'barito-flow-linux'
consumer_binary = node[cookbook_name]['consumer']['binary']
default[cookbook_name]['consumer']['mirror'] =
  "https://github.com/BaritoLog/barito-flow/releases/download/#{consumer_version}/#{consumer_binary}"
default[cookbook_name]['consumer']['service_name'] = 'barito-flow-consumer'

# environment variables
default[cookbook_name]['consumer']['prefix_env_vars'] = '/etc/default'
default[cookbook_name]['consumer']['env_vars_file'] = "#{node[cookbook_name]['consumer']['prefix_env_vars']}/#{node[cookbook_name]['consumer']['service_name']}"
default[cookbook_name]['consumer']['env_vars'] = {}

# consumer daemon options, used to create the ExecStart option in service
default[cookbook_name]['consumer']['cli_opts'] = ['f']

# log file location
default[cookbook_name]['consumer']['prefix_log'] = '/var/log/barito-flow-consumer'
default[cookbook_name]['consumer']['log_file_name'] = 'error.log'

# consumer Systemd service unit, include config
default[cookbook_name]['consumer']['systemd_unit'] = {
  'Unit' => {
    'Description' => 'barito consumer',
    'After' => 'network.target'
  },
  'Service' => {
    'Type' => 'simple',
    'User' => node[cookbook_name]['user'],
    'Group' => node[cookbook_name]['group'],
    'Restart' => 'on-failure',
    'RestartSec' => 2,
    'StartLimitInterval' => 50,
    'StartLimitBurst' => 10,
    'ExecStart' => 'TO_BE_COMPLETED'
  },
  'Install' => {
    'WantedBy' => 'multi-user.target'
  }
}
