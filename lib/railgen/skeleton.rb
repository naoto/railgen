module Railgen
  class Skeleton

    attr_reader :path

    def initialize(path, base)
      @path = path
      @base = base
    end

    def skeleton_path
      @path.gsub("#{@base}/../../skeleton", '')
    end

    def directory?
      File.directory?(@path)
    end

    def erb?
      File.extname(@path) == ".erb"
    end

    def read
      open(@path).read
    end

  end
end
