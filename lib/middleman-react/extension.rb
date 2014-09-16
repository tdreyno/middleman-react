module Middleman
  class ReactExtension < Extension
    option :targets, [], 'The build target information.'

    def initialize(app, options={}, &block)
      super

      require 'fileutils'

      FileUtils.mkdir('tmp') unless File.exist?('tmp');

      ext = self
      app.ready do
        # Re-run on JS file change.
        files.changed(/\.js$/, &ext.method(:recompile!))
      end
    end

    def after_configuration
      # Compile on startup
      recompile!
    end

    # Add the compiled output to Middleman
    def manipulate_resource_list(resources)
      resources + options[:targets].map do |t|
        StaticResource.new(
          app.sitemap,
          t[:output]
        ) { 
          File.read(File.expand_path("tmp/#{t[:output]}", app.root))
        }
      ]
    end

    # Builds the project
    def recompile!(*)
      options[:targets].each do |t|
        flags = []
        flags << "--debug" if t[:debug]
        flags << "-g uglifyify" if t[:minify]

        env = t[:env]
        env[:NODE_ENV] = "production" unless t[:debug]

        env_list = env.reduce([]) do |sum, (k, v)|
          sum << %Q{#{k}="#{v}"}
          sum
        end

        puts "Recompiling: #{t[:output]}"
        puts `#{env_list.join(" ")} ./node_modules/.bin/browserify -t [ reactify --es6 ] #{flags.join(" ")} ./source/#{t[:main]} -o ./tmp/#{t[:output]}`
      end
    end

    # Represents a Middleman page which simply outputs the string
    # or result of calling a block passed in.
    class ::StaticResource < ::Middleman::Sitemap::Resource
      attr_accessor :output

      def initialize(store, path, contents=nil, &block)
        @request_path = path
        @contents = block_given? ? block : contents
        super(store, path)
      end

      def template?
        true
      end

      def get_source_file
        "Dynamic"
      end

      def render(*)
        @contents.respond_to?(:call) ? @contents.call() : @contents
      end

      attr_reader :request_path

      def binary?
        false
      end

      def raw_data
        {}
      end

      def ignored?
        false
      end

      def metadata
        @local_metadata.dup
      end
    end
  end
end
