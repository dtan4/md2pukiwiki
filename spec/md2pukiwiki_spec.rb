require 'spec_helper'

describe Md2pukiwiki do
  describe "#convert" do
    it "should convert header" do
      expect(Md2pukiwiki.convert("# header")).to eq "*header"
    end

    it "should convert sub-header" do
      expect(Md2pukiwiki.convert("## header")).to eq "**header"
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

    it "should convert multi-line text" do
      markdown = <<-EOS.strip
# header
* list1
* list2
    * list2.1

## subheader
1. nlist1
2. nlist2
    1. nlist2.1
      EOS

      pukiwiki = <<-EOS.strip
*header
- list1
- list2
-- list2.1

**subheader
+ nlist1
+ nlist2
++ nlist2.1
      EOS

      expect(Md2pukiwiki.convert(markdown)).to eq pukiwiki
    end
  end
end
