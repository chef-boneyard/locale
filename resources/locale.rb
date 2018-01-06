#
# Cookbook:: locale
# Resource:: locale
#
# Copyright:: 2011-2016, Heavy Water Software Inc.
# Copyright:: 2016-2018, Chef Software Inc.
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

property :lang,   String, default: 'en_US.utf8'
property :lc_all, String, default: 'en_US.utf8'

provides :locale

action :update do
  if ::File.exist?('/usr/sbin/update-locale')
    execute 'Generate locale' do
      command "locale-gen #{new_resource.lang}"
      not_if { up_to_date?('/etc/default/locale', new_resource.lang, new_resource.lc_all) }
    end

    execute 'Update locale' do
      command "update-locale LANG=#{new_resource.lang} LC_ALL=#{new_resource.lc_all}"
      not_if { up_to_date?('/etc/default/locale', new_resource.lang, new_resource.lc_all) }
    end
  elsif ::File.exist?('/usr/bin/localectl')
    # on systemd settings LC_ALL is (correctly) reserved only for testing and cannot be set globally
    execute "localectl set-locale LANG=#{new_resource.lang}" do
      # RHEL uses /etc/locale.conf
      not_if { up_to_date?('/etc/locale.conf', new_resource.lang) } if ::File.exist?('/etc/locale.conf')
      # Ubuntu 16.04 still uses /etc/default/locale
      not_if { up_to_date?('/etc/default/locale', new_resource.lang) } if ::File.exist?('/etc/default/locale')
    end
  elsif ::File.exist?('/etc/sysconfig/i18n')
    locale_file_path = '/etc/sysconfig/i18n'

    file locale_file_path do
      content lazy {
        locale = IO.read(locale_file_path)
        variables = Hash[locale.lines.map { |line| line.strip.split('=') }]
        variables['LANG'] = new_resource.lang
        variables['LC_ALL'] =
          variables.map { |pairs| pairs.join('=') }.join("\n") + "\n"
      }
      not_if { up_to_date?(locale_file_path, new_resource.lang, new_resource.lc_all) }
    end
  else
    raise "#{node['platform']} platform not supported by the locale cookbook."
  end
end

action_class do
  def up_to_date?(file_path, lang, lc_all = nil)
    locale = IO.read(file_path)
    locale.include?("LANG=#{lang}") &&
      (lc_all.nil? || locale.include?("LC_ALL=#{lc_all}"))
  rescue
    false
  end
end
