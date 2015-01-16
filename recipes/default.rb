#
# Cookbook Name:: ssh-import-id
# Recipe:: default
#
# Copyright (C) 2014
#
#
#

include_recipe 'apt::default'

package 'ssh-import-id'

node['ssh_import_id']['users'].each do |user|
  ssh_import_id user['name'] do
    github_accounts user['github_accounts']
  end
end
