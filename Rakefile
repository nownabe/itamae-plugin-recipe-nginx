require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "tempfile"
require "net/ssh"

VAGRANT_HOSTNAME = "itamae-spec-nownabe"
VAGRANT_ENV = { "VAGRANT_CWD" => File.expand_path("./spec/integration") }

recipes =
  Dir[File.expand_path("../spec/integration/**/*", __FILE__)].select do |path|
    File.directory?(path)
  end.map do |path|
    path[%r{integration/(.+)/?$}, 1]
  end

recipes.each do |recipe|
  raked_recipe = recipe.gsub("/", ":")
  desc "Run integration test for #{recipe}"
  task :"#{raked_recipe}" => ["#{raked_recipe}:provision", "#{raked_recipe}:spec", "#{raked_recipe}:destroy"]

  namespace raked_recipe do
    desc "Provision Vagrant with #{recipe} recipe"
    task :provision do
      tmp_ssh_config = Tempfile.new("", Dir.tmpdir)

      Bundler.with_clean_env do
        system(VAGRANT_ENV, "vagrant up #{VAGRANT_HOSTNAME}") || abort
        system(VAGRANT_ENV, "vagrant ssh-config #{VAGRANT_HOSTNAME} > #{tmp_ssh_config.path}") || abort

        ssh_option = Net::SSH::Config.for(VAGRANT_HOSTNAME, [tmp_ssh_config.path])

        cmd = %W(
          bundle exec itamae ssh
          -h #{ssh_option[:host_name]}
          -u #{ssh_option[:user]}
          -p #{ssh_option[:port]}
          -i #{ssh_option[:keys].first}
          -l debug
          -y spec/integration/#{recipe}/node.yml
          spec/integration/#{recipe}/recipe.rb
        )

        cmd << "--dry-run" if ENV["DRY_RUN"]

        cmd_str = cmd.join(" ")
        puts "Execute: #{cmd_str}"
        system(cmd_str) || abort
      end
    end

    desc "Run serverspec tests for #{recipe}"
    RSpec::Core::RakeTask.new(:spec) do |t|
      t.ruby_opts = "-I ./spec/integration/"
      t.pattern = "spec/integration/#{recipe}/*_spec.rb"
    end

    desc "Destroy Vagrant virtual machine"
    task :destroy do
      Bundler.with_clean_env do
        cmd = ["vagrant destroy"]
        cmd << "-f" if ENV["CI"]
        cmd << VAGRANT_HOSTNAME

        system(VAGRANT_ENV, cmd.join(" "))
      end
    end
  end
end
