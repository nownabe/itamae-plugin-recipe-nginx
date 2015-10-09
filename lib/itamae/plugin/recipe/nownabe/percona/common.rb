percona_repo_url =
  "http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm"

execute "install Percona repository" do
  command "yum install -y #{percona_repo_url}"
  not_if "rpm -q percona-release"
end
