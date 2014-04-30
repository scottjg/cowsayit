class Fortune
  @@fortune_exe = nil
  def self.fortune_exe
    return @@fortune_exe if @@fortune_exe

    # for heroku
    @@fortune_exe = ".apt/usr/games/fortune -s .apt/usr/share/games/fortunes/"
    begin
      `#{@@fortune_exe}`
      return @@fortune_exe
    rescue Errno::ENOENT
    end

    # everywhere else
    @@fortune_exe = "fortune -s"
    `#{@@fortune_exe}`

    @@fortune_exe
  end

  def self.get
    `#{fortune_exe}`.gsub(/\t/, "  ").rstrip
  end
end
