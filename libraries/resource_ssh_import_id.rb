require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class SshImportId < Chef::Resource::LWRPBase
      self.resource_name = :ssh_import_id
      actions :create
      default_action :create

      attribute :user, kind_of: String, name_attribute: true
      attribute :github_accounts, kind_of: Array, required: true
    end
  end
end
