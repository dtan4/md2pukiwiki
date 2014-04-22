require "md2pukiwiki/version"

module Md2pukiwiki
  def self.convert(text)
    text.lines.map do |line|
      convert_header(line)
    end.join("\n")
  end

  private

  def self.convert_header(line)
    line.strip!

    if /\A(?<sharps>#+) (?<header>.+)\z/ =~ line
      "#{'*' * sharps.length}#{header}"
    else
      line
    end
  end
end
