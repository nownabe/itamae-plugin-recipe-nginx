require 'serverspec'
require 'net/ssh'
require 'tempfile'

set :backend, :ssh

host = "itamae-spec-nownabe"

config = Tempfile.new('', Dir.tmpdir)

Bundler.with_clean_env do
  system(
    { "VAGRANT_CWD" => File.dirname(__FILE__) },
    "vagrant ssh-config #{host} > #{config.path}"
  )
end

options = Net::SSH::Config.for(host, [config.path])

options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options
