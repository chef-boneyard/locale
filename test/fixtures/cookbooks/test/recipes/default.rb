locale 'default'

file_content = <<-EOH
function setup {
  [ -f /etc/default/locale ] && . /etc/default/locale
  [ -f /etc/locale.conf ] && . /etc/locale.conf
  [ -f /etc/sysconfig/i18n ] && . /etc/sysconfig/i18n
  true;
}

setup
EOH

file '/tmp/setup_locale.sh' do
  content file_content
  mode '0755'
  owner 'root'
  group 'root'
end
