module Bishopi
  class Crawler
    attr_reader :worklist

    def initialize(indexer, seed_filename, output=STDOUT)
      @indexer = indexer
      @output = output
      @worklist = File.readlines(seed_filename).each do |line|
        line.chomp!
      end
    end

    def start
      @output.puts "Bishopi starting to crawl..."
      until @worklist.empty?
        url = @worklist.shift
        @output.puts "Processing '#{url}'"
        @indexer.index(url)
      end
    end
  end
end
