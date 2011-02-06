require 'nokogiri'

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
      new_worklist = []
      @output.puts "Bishopi starting to crawl..."
      until @worklist.empty?
        url = @worklist.shift
        @output.puts "Processing '#{url}'"
        doc = Nokogiri::HTML(open(url))
        new_worklist << doc.css('a').map { |e| e.attributes["href"].value }
        @indexer.index(url)
      end

      @worklist = new_worklist.flatten
    end
  end
end
