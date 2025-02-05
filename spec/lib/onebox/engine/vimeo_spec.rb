require "spec_helper"

describe Onebox::Engine::VimeoOnebox do
  let(:link) { "http://vimeo.com" }
  before do
    fake(link, response("vimeo.response"))
  end

  it_behaves_like "engines"

  describe "#to_html" do
    let(:html) { described_class.new(link).to_html }

    it "returns video title" do
      expect(html).to include("108 years of Herman Miller in 108 seconds")
    end

    it "returns video photo" do
      expect(html).to include("443673159_1280.jpg")
    end

    it "returns video description" do
      expect(html).to include("To mark the launch of a new website for Hermann Miller furniture")
    end

    it "returns video URL" do
      expect(html).to include("http://vimeo.com/moogaloop.swf?clip_id=70437049")
    end

    it "returns URL" do
      expect(html).to include(link)
    end
  end
end
