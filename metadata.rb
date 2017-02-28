name             'locale'
maintainer       'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license          'Apache 2.0'
description      'Installs/Configures locale'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.0'

supports 'ubuntu'
supports 'debian'
supports 'centos'
supports 'redhat'
supports 'scientific'
supports 'fedora'
supports 'oracle'

source_url 'https://github.com/chef-cookbooks/locale'
issues_url 'https://github.com/chef-cookbooks/locale/issues'
chef_version '>= 12.1' if respond_to?(:chef_version)
