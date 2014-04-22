require "md2pukiwiki/version"

module Md2pukiwiki
  def self.convert(text)
    text.lines.map do |line|
      new_line = line.strip

      new_line = convert_header(new_line)
      new_line = convert_list(new_line)
      new_line = convert_numbered_list(new_line)

      new_line
    end.join("\n")
  end

  private

  def self.convert_header(line)
    if /\A(?<sharps>#+) (?<header>.+)\z/ =~ line
      "#{'*' * sharps.length}#{header}"
    else
      line
    end
  end

  def self.convert_list(line)
    if /\A(?<asterisks>\*+) (?<list>.+)\z/ =~ line
      "#{'-' * asterisks.length} #{list}"
    else
      line
    end
  end

  def self.convert_numbered_list(line)
    if /\A\d+\. (?<list>.+)\z/ =~ line
      "+ #{list}"
    else
      line
    end
  end
end
