#
# Cookbook Name:: locale
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform']
when 'debian', 'ubuntu'
  include_recipe('locale::_debian')
when 'redhat', 'centos', 'scientific'
  if node['platform_version'].to_f >= 7
    include_recipe('locale::_systemd')
  else
    include_recipe('locale::_rhel')
  end
when 'amazon'
  # FIXME: need some useful version checking on this
  include_recipe('locale::_rhel')

when 'fedora'
  include_recipe('locale::_systemd')
end
