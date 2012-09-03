require 'spec_helper'

describe Pick do
  describe "#fetch_links" do
    use_vcr_cassette "picks/index"

    it "should populate the database with picks" do
      lambda do
        Pick.fetch_links
      end.should change(Pick, :count).by(667)
    end

    it "should create a pick with a title and a link" do
      Pick.fetch_links
      pick = Pick.first
      pick.link.should == "http://www.amazon.com/gp/product/0672320835/ref=as_li_ss_tl?ie=UTF8&tag=chamaxwoo-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=0672320835"
      pick.title.should == "The Ruby Way by Hal Fulton"
    end
  end

  describe "#random" do
    it "should find a randomized pick" do
      Pick.should_receive(:count).and_return(6)
      Pick.should_receive(:rand).and_return(4)
      Pick.should_receive(:find).with(4)
      Pick.random
    end
  end
end
