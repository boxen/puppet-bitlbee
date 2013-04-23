require 'spec_helper'

describe 'bitlbee' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'testuser',
      :luser => 'goober',
    }
  end
  it { should include_class('bitlbee::config') }
  it { should contain_package('bitlbee').with_provider('homebrew') }
  it { should contain_file('/Library/LaunchDaemons/bitlbee.plist').with( 'group' => 'wheel', 'owner' => 'root') }
  it { should contain_file('/Library/LaunchDaemons/bitlbee.plist').with_content(/<string>-p<\/string>\s*<string>6667<\/string>/) }
  it { should contain_file('/Library/LaunchDaemons/bitlbee.plist').with_content(/<string>-i<\/string>\s*<string>localhost<\/string>/), "Should be running with -i localhost." }
  it { should contain_file('/Library/LaunchDaemons/bitlbee.plist').with_content(/<key>UserName<\/key>\s*<string>#{facts[:luser]}<\/string>/) }
  it { should contain_file("#{facts[:boxen_home]}/config/bitlbee").with('ensure' => 'directory') }
  it { should contain_file("#{facts[:boxen_home]}/log/bitlbee").with('ensure' => 'directory') }
  it { should contain_service('bitlbee').with(:ensure => 'running') }
end
