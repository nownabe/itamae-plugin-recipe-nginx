require 'spec_helper'

describe package("percona-release") do
  it { should be_installed }
end
