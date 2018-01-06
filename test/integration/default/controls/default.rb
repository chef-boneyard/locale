# frozen_string_literal: true
locale_file = if ::File.exist?('/etc/default/locale')
                '/etc/default/locale'
              elsif ::File.exist?('/etc/locale.conf')
                '/etc/locale.conf'
              else
                '/etc/sysconfig/i18n'
              end

control 'Set LANG using default resource values' do
  title 'LANG should be en_US.utf8'

  desc 'Locale setting LANG'
  describe bash(". #{locale_file} && locale") do
    its('exit_status') { should eq 0 }
    its('stdout') { should match /LANG=en_US.utf8/ }
  end
end

control 'Set LC_ALL using default resource values' do
  title 'LC_ALL should be en_US.utf8'

  desc 'Locale setting LC_ALL'
  describe bash('. #{locale_file} && locale') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match /LC_ALL=en_US.utf8/ }
  end
end
