module Locale
  class << self
    def up_to_date?(file_path, lang, lc_all)
      return false unless ::File.exist?(file_path)

      locale = IO.read(file_path)
      locale.include?("LANG=#{lang}") && locale.include?("LC_ALL=#{lc_all}")
    end
  end
end
