require "md2pukiwiki/version"

module Md2pukiwiki
  def self.convert(text)
    text.lines.map do |line|
      new_line = line.chomp

      new_line = convert_header(new_line)
      new_line = convert_list(new_line)
      new_line = convert_numbered_list(new_line)
      new_line = convert_bold_characters(new_line)
      new_line = convert_italic_characters(new_line)

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
    if /\A(?<spaces>\s*)\* (?<list>.+)\z/ =~ line
      "#{'-' * (spaces.length / 4 + 1)} #{list}"
    else
      line
    end
  end

  def self.convert_numbered_list(line)
    if /\A(?<spaces>\s*)\d+\. (?<list>.+)\z/ =~ line
      "#{'+' * (spaces.length / 4 + 1)} #{list}"
    else
      line
    end
  end

  def self.convert_bold_characters(line)
    line.gsub(/\*{2}(?<bold>.+?)\*{2}/, "''\\k<bold>''")
  end

  def self.convert_italic_characters(line)
    line.gsub(/\*{1}(?<italic>.+?)\*{1}/, "'''\\k<italic>'''")
  end
end
