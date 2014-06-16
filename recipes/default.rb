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
  user['github_accounts'].each do |acct|
    execute "Import github/#{acct}.keys for user #{user['name']}" do
      command "su #{user['name']} -l -c 'cd $HOME && ssh-import-id gh:#{acct}'"
    end
  end
end
