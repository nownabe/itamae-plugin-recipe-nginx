remote_file "/etc/yum.repos.d/nginx.repo" do
  owner "root"
  group "root"
  mode "0644"
end

package "nginx"

actions = []
actions << :start if node.nginx.start
actions << :enable if node.nginx.enable
actions << :nothing if actions.empty?

service "nginx" do
  action actions
end
