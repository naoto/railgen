module Railgen
  class New

    def self.exec(options)
      generator = new(options)
      generator.make_app_directory
      generator.skeleton
    end

    def initialize(options)
      @options = options
    end

    def make_app_directory
      Dir.mkdir("#{target}/#{namespace_to_snake}")
    end

    def skeleton
      files = skeleton_files
      files.each do |file|
        filepath = "#{target}/#{namespace_to_snake}#{file.skeleton_path.gsub('skeleton', namespace_to_snake).gsub(/\.erb$/,'')}"
        puts "create #{filepath}"
        if file.directory?
          Dir.mkdir(filepath)
        elsif file.erb?
          open(filepath, 'w+') do |f|
            f.write ERB.new(file.read).result(binding)
          end
        else
          open(filepath, 'w+') do |f|
            f.write file.read
          end
        end
      end
    end

    private
     def target
       @options[:target] ||= './'
     end

     def namespace
       @options[:namespace] ||= 'Sample'
     end

     def namespace_to_snake
       Rinne.to_snake(namespace)
     end

     def skeleton_files
       Dir.glob("#{File.dirname(__FILE__)}/../../skeleton/**/*", File::FNM_DOTMATCH).map do |v| 
         Skeleton.new(v, File.dirname(__FILE__))
       end
     end

  end
end
