require 'optparse'

module Railgen
  class CLI

    def initialize(argv)
      @options = options(argv)
    end

    def exec
      if @options[:command].nil?
        puts "command not found"
      else
        eval "#{@options[:command]}.exec(@options)"
      end
    end


    private
     def options(argv)
       option = {}
       op = OptionParser.new
       op.on('-t','--target VAL','target directory'){ |v| option[:target] = v }
       op.permute!(argv)
       option[:command] = Rinne.camelize(argv.shift) unless argv.empty?
       option[:namespace] = Rinne.camelize(argv.shift) unless argv.empty?
       option
     end

  end
end
