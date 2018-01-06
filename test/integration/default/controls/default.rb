# frozen_string_literal: true

control 'Set LANG using default resource values' do
  title 'LANG should be en_US.utf8'

  desc 'Locale setting LANG'
  describe bash("source /tmp/setup_locale.sh && setup && locale") do
    its('exit_status') { should eq 0 }
    its('stdout') { should match /LANG=en_US.utf8/ }
  end
end

control 'Set LC_ALL using default resource values' do
  title 'LC_ALL should be en_US.utf8'

  desc 'Locale setting LC_ALL'
  describe bash('source /tmp/setup_locale.sh && setup && locale') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match /LC_ALL=en_US.utf8/ }
  end
end
