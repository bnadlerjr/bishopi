module Bishopi
  class Crawler
    attr_reader :worklist

    def initialize(seed_filename, output=STDOUT)
      @output = output
      @worklist = File.readlines(seed_filename).each do |line|
        line.chomp!
      end
    end

    def start
      @output.puts "Bishopi starting to crawl..."
      @output.puts "Processing '#{@worklist[0]}'"
    end
  end
end
