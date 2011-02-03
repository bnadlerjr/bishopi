module Bishopi
  class Crawler
    def initialize(output=STDOUT)
      @output = output
    end

    def start
      @output.puts "Bishopi starting to crawl..."
    end
  end
end
