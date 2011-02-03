require "#{File.dirname(__FILE__)}/../lib/bishopi"

module Bishopi
  describe "#start" do
    it "shows a welcome message" do
      output = double('output')
      output.should_receive(:puts).
        with('Bishopi starting to crawl...')

      spider = Crawler.new(output)
      spider.start
    end
  end
end
