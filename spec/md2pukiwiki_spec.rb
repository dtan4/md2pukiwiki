require 'spec_helper'

describe Md2pukiwiki do
  describe "#convert" do
    it "should convert header" do
      expect(Md2pukiwiki.convert("# header")).to eq "*header"
    end

    it "should convert sub-header" do
      expect(Md2pukiwiki.convert("## header")).to eq "**header"
    end

    it "should convert subsub-header" do
      expect(Md2pukiwiki.convert("### header")).to eq "***header"
    end

    it "should convert list" do
      expect(Md2pukiwiki.convert("* list")).to eq "- list"
    end

    it "should convert nested list" do
      expect(Md2pukiwiki.convert("    * list")).to eq "-- list"
    end

    it "should convert numbered list" do
      expect(Md2pukiwiki.convert("1. list")).to eq "+ list"
    end

    it "should convert nested numbered list" do
      expect(Md2pukiwiki.convert("    1. list")).to eq "++ list"
    end

    it "should convert bold text" do
      expect(Md2pukiwiki.convert("**bold**")).to eq "''bold''"
    end

    it "should convert underscore-notation bold text" do
      expect(Md2pukiwiki.convert("__bold__")).to eq "''bold''"
    end

    it "should convert italic text" do
      expect(Md2pukiwiki.convert("*italic*")).to eq "'''italic'''"
    end

    it "should convert underscore-notation italic text" do
      expect(Md2pukiwiki.convert("_italic_")).to eq "'''italic'''"
    end

    it "should convert strikethrough text" do
      expect(Md2pukiwiki.convert("~~strikethrough~~")).to eq "%%strikethrough%%"
    end

    it "should convert link" do
      expect(Md2pukiwiki.convert("[link](http://link.com)")).to eq "[[link:http://link.com]]"
    end

    it "should convert image" do
      converted = Md2pukiwiki.convert("![image](http://link.com/image.jpg)")
      expect(converted).to eq "#ref(http://link.com/image.jpg,image)"
    end

    it "should convert image link" do
      converted = Md2pukiwiki.convert("[![ImageLink](http://link.com/image.jpg)](http://link.com/)")
      expect(converted).to eq "[[#ref(http://link.com/image.jpg,ImageLink):http://link.com/]]"
    end

    it "should convert multi-line text" do
      markdown = <<-EOS.strip
# header
* list1
* l**is**t2
    * list2.1

## subheader
1. nlist1
2. nl*is*t2
    1. nlist2.1
      EOS

      pukiwiki = <<-EOS.strip
*header
- list1
- l''is''t2
-- list2.1

**subheader
+ nlist1
+ nl'''is'''t2
++ nlist2.1
      EOS

      expect(Md2pukiwiki.convert(markdown)).to eq pukiwiki
    end
  end
end
