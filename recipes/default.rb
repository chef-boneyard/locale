#
# Cookbook:: locale
# Recipe:: default
#
# Copyright:: 2011-2016, Heavy Water Software Inc.
# Copyright:: 2016, Chef Software Inc.
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

lang = node['locale']['lang']
lc_all = node['locale']['lc_all'] || lang

if File.exist?('/usr/sbin/update-locale')
  execute 'Generate locale' do
    command "locale-gen #{lang}"
    not_if { Locale.up_to_date?('/etc/default/locale', lang, lc_all) }
  end

  execute 'Update locale' do
    command "update-locale LANG=#{lang} LC_ALL=#{lc_all}"
    not_if { Locale.up_to_date?('/etc/default/locale', lang, lc_all) }
  end
elsif File.exist?('/usr/bin/localectl')
  # on systemd settings LC_ALL is (correctly) reserved only for testing and cannot be set globally
  execute "localectl set-locale LANG=#{lang}" do
    # RHEL uses /etc/locale.conf
    not_if { Locale.up_to_date?('/etc/locale.conf', lang, nil) } if File.exist?('/etc/locale.conf')
    # Ubuntu 16.04 still uses /etc/default/locale
    not_if { Locale.up_to_date?('/etc/default/locale', lang, nil) } if File.exist?('/etc/default/locale')
  end
elsif File.exist?('/etc/sysconfig/i18n')
  locale_file_path = '/etc/sysconfig/i18n'

  file locale_file_path do
    content lazy {
      locale = IO.read(locale_file_path)
      variables = Hash[locale.lines.map { |line| line.strip.split('=') }]
      variables['LANG'] = lang
      variables['LC_ALL'] = lc_all
      variables.map { |pairs| pairs.join('=') }.join("\n") + "\n"
    }
    not_if { Locale.up_to_date?(locale_file_path, lang, lc_all) }
  end
else
  raise "#{node['platform']} platform not supported by the locale cookbook."
end
