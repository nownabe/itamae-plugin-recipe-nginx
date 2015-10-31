require "spec_helper"

describe package("nginx") do
  it { is_expected.to be_installed }
end

describe service("nginx") do
  it { is_expected.to be_running }
  it { is_expected.to be_enabled }
end
