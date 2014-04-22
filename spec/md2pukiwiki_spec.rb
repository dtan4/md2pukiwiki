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
  end
end
