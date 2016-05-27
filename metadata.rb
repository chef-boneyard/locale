name             'locale'
maintainer       'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license          'Apache 2.0'
description      'Installs/Configures locale'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.1.0'

supports 'ubuntu'
supports 'debian'
supports 'centos'
supports 'redhat'
supports 'scientific'
supports 'fedora'

source_url 'https://github.com/chef-cookbooks/locale' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/locale/issues' if respond_to?(:issues_url)
