module Locale
  class << self
    def up_to_date?(file_path, lang, lc_all)
      begin
        locale = IO.read(file_path)
        locale.include?("LANG=#{lang}") && locale.include?("LC_ALL=#{lc_all}")
      rescue Errno::ENOENT
        false
      end
    end
  end
end
