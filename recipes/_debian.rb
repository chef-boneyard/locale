lang = node['locale']['lang']
lc_all = node['locale']['lc_all'] || lang

package "locales" do
  action :install
end

execute "Generate locale" do
  command "locale-gen #{lang}"
  not_if { Locale.up_to_date?("/etc/default/locale", lang, lc_all) }
end

execute "Update locale" do
  command "update-locale LANG=#{lang} LC_ALL=#{lc_all}"
  not_if { Locale.up_to_date?("/etc/default/locale", lang, lc_all) }
end
