require "#{File.dirname(__FILE__)}/../lib/bishopi"

module Bishopi
  SAMPLE_URL_FILE = "#{File.dirname(__FILE__)}/sample-url-file.txt"

  describe Crawler do
    before do
      @output = double('output').as_null_object
    end

    describe "#initialize" do
      it "creates a worklist from a seed file" do
        spider = Crawler.new(SAMPLE_URL_FILE, @output)
        spider.worklist.should_not be_nil
      end
    end

    describe "#start" do
      it "shows a welcome message" do
        @output.should_receive(:puts).
          with('Bishopi starting to crawl...')

        spider = Crawler.new(SAMPLE_URL_FILE, @output)
        spider.start
      end

      it "stops when all URLs in worklist have been crawled"
    end

    describe "#process" do
      it "shows the URL being processed" do
        @output.should_receive(:puts).
          with("Processing 'http://bobnadler.com'")

        spider = Crawler.new(SAMPLE_URL_FILE, @output)
        spider.start
      end

      it "retrieves a list of links on the page"
      it "indexes the page if it doesn't exist"
      it "does not index the page if robots are not allowed"
    end
  end
end
