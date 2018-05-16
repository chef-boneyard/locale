require 'spec_helper'

describe 'default recipe on centos 6.8' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'centos', version: '6.9') }
  let(:chef_run) { runner.converge('locale::default') }

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on centos 7.3.1611' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3.1611') }
  let(:chef_run) { runner.converge('locale::default') }

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on ubuntu 14.04' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04') }
  let(:chef_run) { runner.converge('locale::default') }

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on ubuntu 16.04' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') }
  let(:chef_run) { runner.converge('locale::default') }

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
