# check file if it includes the local string
module Locale
  class << self
    def up_to_date?(file_path, lang, lc_all)
      locale = IO.read(file_path)
      locale.include?("LANG=#{lang}") &&
        (lc_all.nil? || locale.include?("LC_ALL=#{lc_all}"))
    rescue
      false
    end
  end
end
