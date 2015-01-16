require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class SshImportId < Chef::Provider::LWRPBase
      include Chef::DSL::IncludeRecipe
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :create do
        package 'ssh-import-id'

        new_resource.github_accounts.each do |acct|
          execute "Import github/#{acct}.keys for user #{new_resource.user}" do
            command "su #{new_resource.user} -l -c 'cd $HOME && ssh-import-id gh:#{acct}'"
          end
        end
      end
    end
  end
end
