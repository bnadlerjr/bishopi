require "#{File.dirname(__FILE__)}/../lib/bishopi"

module Bishopi
  SAMPLE_URL_FILE = "#{File.dirname(__FILE__)}/sample-url-file.txt"
  FIXTURES_PATH   = "#{File.dirname(__FILE__)}/fixtures"

  describe Crawler do
    before do
      @indexer = double('indexer').as_null_object
      @output = double('output').as_null_object
      @spider = Crawler.new(@indexer, SAMPLE_URL_FILE, @output)
    end

    describe "#initialize" do
      it "creates a worklist from a seed file" do
        @spider.worklist.should_not be_nil
      end
    end

    describe "#start" do
      it "shows a welcome message" do
        @output.should_receive(:puts).
          with('Bishopi starting to crawl...')

        @spider.start
      end

      it "stops when all URLs in worklist have been crawled"
    end

    describe "#process" do
      it "shows the URL being processed" do
        @output.should_receive(:puts).
          with("Processing '#{FIXTURES_PATH}/index.html'")

        @spider.start
      end

      it "removes a url form the worklist when it is indexed" do
        @spider.start
        @spider.worklist.should_not include("#{FIXTURES_PATH}/index.html")
      end

      it "adds a url found on the page to the worklist" do
        @spider.start
        @spider.worklist.should include('contact.html')
      end

      it "does not add duplicate urls to the new worklist" do
        @spider.start
        @spider.worklist.should == ['contact.html', 'services.html']
      end

      it "passes the page to the indexer for indexing" do
        @indexer.should_receive(:index).
          with("#{FIXTURES_PATH}/index.html")

        @spider.start
      end

      it "does not index the page if robots are not allowed"
    end
  end
end
