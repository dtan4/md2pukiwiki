require "md2pukiwiki/version"

module Md2pukiwiki
  def self.convert(text)
    prefixed_type = %w{header list numbered_list}
    decorated_type = %w{bold italic strikethrough}
    special_type = %w{image link}

    text.lines.map do |line|
      new_line = line.chomp

      [prefixed_type, decorated_type, special_type].flatten.each do |type|
        new_line = self.send("convert_#{type}", new_line)
      end

      new_line
    end.join("\n")
  end

  private

  # "# header" => "*header"
  def self.convert_header(line)
    if /\A(?<sharps>#+) (?<header>.+)\z/ =~ line
      "#{'*' * sharps.length}#{header}"
    else
      line
    end
  end

  # "* list" => "- list"
  def self.convert_list(line)
    if /\A(?<spaces>\s*)\* (?<list>.+)\z/ =~ line
      "#{'-' * (spaces.length / 4 + 1)} #{list}"
    else
      line
    end
  end

  # "1. list" => "+ list"
  def self.convert_numbered_list(line)
    if /\A(?<spaces>\s*)\d+\. (?<list>.+)\z/ =~ line
      "#{'+' * (spaces.length / 4 + 1)} #{list}"
    else
      line
    end
  end

  # "**bold**" => "''bold''"
  def self.convert_bold(line)
    line.gsub(/(?:\*{2}|_{2})(?<bold>.+?)(?:\*{2}|_{2})/, "''\\k<bold>''")
  end

  # "*italic*" => "'''italic'''"
  def self.convert_italic(line)
    line.gsub(/(?:\*{1}|_{1})(?<italic>.+?)(?:\*{1}|_{1})/, "'''\\k<italic>'''")
  end

  # "~~strikethrough~~" => "%%strikethrough%%"
  def self.convert_strikethrough(line)
    line.gsub(/~{2}(?<strikethrough>.+?)~{2}/, '%%\k<strikethrough>%%')
  end

  # "![text](image)" => "#ref(image,text)"
  def self.convert_image(line)
    line.gsub(/!\[(?<text>.+?)\]\((?<image>.+?)\)/, '#ref(\k<image>,\k<text>)')
  end

  # "[text](link)" => "[[text:link]]"
  def self.convert_link(line)
    line.gsub(/\[(?<text>.+?)\]\((?<link>.+?)\)/, '[[\k<text>:\k<link>]]')
  end
end
