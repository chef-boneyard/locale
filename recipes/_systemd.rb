lang = node['locale']['lang']
lc_all = node['locale']['lc_all'] || lang

package 'systemd' do
  action :install
end

# It is not permitted to set LC_ALL in the locale conf file on Fedora.
bash 'Update locale' do
  code "echo localectl set-locale LANG=#{lang} > /tmp/foo ; localectl set-locale LANG=#{lang} >> /tmp/foo 2>&1"
  not_if { Locale.up_to_date?('/etc/locale.conf', lang, nil) }
end
