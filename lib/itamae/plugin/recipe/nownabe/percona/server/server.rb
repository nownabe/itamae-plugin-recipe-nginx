package "Percona-Server-server-#{node.percona.server.version.to_s.sub('.', '')}"

actions = []
actions << :start if node.percona.server.start
actions << :enable if node.percona.server.enable
actions << :nothing if actions.empty?

service "mysqld" do
  action actions
end
