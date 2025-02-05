require "spec_helper"

describe Onebox::Engine::YfrogOnebox do
  let(:link) { "http://yfrog.com" }
  before do
    fake(link, response("yfrog.response"))
  end

  it_behaves_like "engines"

  describe "#to_html" do
    let(:html) { described_class.new(link).to_html }

    it "returns photo title" do
      expect(html).to include("Celebrating @questlove Cook4Quest w/WyattCenac")
    end

    it "returns photo" do
      expect(html).to include("jjdob.jpg")
    end

    it "returns photo description" do
      expect(html).to include("Click on the photo to comment, share or view other great photos")
    end

    it "returns URL" do
      expect(html).to include(link)
    end
  end
end
