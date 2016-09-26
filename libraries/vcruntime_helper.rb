# https://blog.chef.io/2014/03/12/writing-libraries-in-chef-cookbooks/

module Vcruntime
  module Helper

    include Chef::Mixin::ShellOut

    def has_hotfix?(hotfix_id)
      cmd = shell_out!("#{ENV['WINDIR']}\\system32\\WindowsPowerShell\\v1.0\\powershell.exe -NoLogo \
	-NonInteractive -NoProfile -ExecutionPolicy RemoteSigned Get-Hotfix -ID #{hotfix_id} \
	-ErrorAction SilentlyContinue", {:returns => [0,1]})
      cmd.stderr.empty? && (cmd.exitstatus == 0)
    end
  end
end