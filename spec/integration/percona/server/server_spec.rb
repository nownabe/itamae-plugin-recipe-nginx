describe package("Percona-Server-server-56") do
  it { should be_installed }
end

describe package("Percona-Server-client-56") do
  it { should be_installed }
end

describe package("Percona-Server-devel-56") do
  it { should be_installed }
end

describe service("mysqld") do
  it { should be_running }
  it { should be_enabled }
end

describe port(3306) do
  it { should be_listening }
end
