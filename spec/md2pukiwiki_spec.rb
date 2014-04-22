require 'spec_helper'

describe Md2pukiwiki do
  describe "#convert" do
    it "should convert header" do
      expect(Md2pukiwiki.convert("# header")).to eq "*header"
    end

    it "should convert sub-header" do
      expect(Md2pukiwiki.convert("## header")).to eq "**header"
    end
  end
end
