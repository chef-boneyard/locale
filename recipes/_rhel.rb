lang = node['locale']['lang']
lc_all = node['locale']['lc_all'] || lang

locale_file_path = "/etc/sysconfig/i18n"

file locale_file_path do
  content lazy {
    locale = IO.read(locale_file_path)
    variables = Hash[locale.lines.map { |line| line.strip.split("=") }]
    variables["LANG"] = lang
    variables["LC_ALL"] = lc_all
    variables.map { |pairs| pairs.join("=") }.join("\n") + "\n"
  }
  not_if { Locale.up_to_date?(locale_file_path, lang, lc_all) }
end
