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
  describe "bitlbee.plist" do
    it { should contain_file('/Library/LaunchDaemons/bitlbee.plist').with_content(/<key>ProgramArguments<\/key>\s*<array>\s*<string>#{facts[:boxen_home]}\/homebrew\/sbin\/bitlbee<\/string>/), "Executable should be /opt/boxen/homebrew/sbin/bitlbee" }
    it { should contain_file('/Library/LaunchDaemons/bitlbee.plist').with_content(/<string>-D<\/string>/), "Should run in daemon mode" }
    it { should contain_file('/Library/LaunchDaemons/bitlbee.plist').with_content(/<string>-p<\/string>\s*<string>6667<\/string>/), "Should run on port 6667" }
    it { should contain_file('/Library/LaunchDaemons/bitlbee.plist').with_content(/<string>-i<\/string>\s*<string>localhost<\/string>/), "Should be running with -i localhost." }
    it { should contain_file('/Library/LaunchDaemons/bitlbee.plist').with_content(/<key>UserName<\/key>\s*<string>#{facts[:luser]}<\/string>/) }
    it { should contain_file('/Library/LaunchDaemons/bitlbee.plist').with_content(/<key>StandardErrorPath<\/key>\s*<string>#{facts[:boxen_home]}\/log\/bitlbee\/console.log<\/string>/), "Stderr should go to #{facts[:boxen_home]}/log/bitlbee/console.log" }
    it { should contain_file('/Library/LaunchDaemons/bitlbee.plist').with_content(/<key>StandardOutPath<\/key>\s*<string>#{facts[:boxen_home]}\/log\/bitlbee\/console.log<\/string>/), "Stdout should go to #{facts[:boxen_home]}/log/bitlbee/console.log" }
  end
  it { should contain_file("#{facts[:boxen_home]}/config/bitlbee").with('ensure' => 'directory') }
  it { should contain_file("#{facts[:boxen_home]}/log/bitlbee").with('ensure' => 'directory') }
  it { should contain_service('bitlbee').with(:ensure => 'running') }
  end
