require_relative '../spec_helper'

# ChefSpec - https://github.com/sethvargo/chefspec#readme
describe 'locale::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }
  let(:chef_run_centos7) { ChefSpec::SoloRunner.new(platform: 'centos', version: '7.0').converge(described_recipe) }
  let(:chef_run_ubuntu1204) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe) }
  let(:chef_run_fedora) { ChefSpec::SoloRunner.new(platform: 'fedora', version: '20').converge(described_recipe) }

  it 'uses rhel resources for centos 6' do
    expect(chef_run).to include_recipe('locale::_rhel')
    expect(chef_run).to create_file('/etc/sysconfig/i18n')
  end

  it 'uses debian resources for ubuntu 12.04' do
    expect(chef_run_ubuntu1204).to include_recipe('locale::_debian')
    expect(chef_run_ubuntu1204).to install_package('locales')
  end

  it 'uses systemd resources for centos 7.0 and fedora' do
    expect(chef_run_centos7).to include_recipe('locale::_systemd')
    expect(chef_run_centos7).to install_package('systemd')
    expect(chef_run_fedora).to include_recipe('locale::_systemd')
    expect(chef_run_fedora).to install_package('systemd')
  end
end
