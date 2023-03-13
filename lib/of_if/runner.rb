# frozen_string_literal: true

require 'fileutils'

module OfIf
  # Procedures to run an analyzer session.
  class Runner
    DEFAULT_TARGET_DIR = './of-if'

    attr_writer :logger, :source_files, :target_dir

    def initialize(logger = $stdout) = @logger = logger

    def call
      ensure_dir
      source_files.each do |file|
        @logger << '.'
        Image.from_sourcefile(file).write targetfile_from(file)
      end
      @logger << "Done\n"
    end

    private

    def source_files
      @source_files ||= exclude_vendor_files Dir.glob('**/*.rb')
    end

    def target_dir = @target_dir ||= DEFAULT_TARGET_DIR

    def exclude_vendor_files(files) = files.reject { |file| file.start_with? 'vendor' }

    def ensure_dir = FileUtils.mkdir_p target_dir

    def targetfile_from(sourcefile)
      path, file = ::File.split sourcefile
      path = '_' if path == '.'
      target_filename = "#{path.gsub('/', '_')}_#{file.split('.')[0]}.png"
      ::File.join target_dir, target_filename
    end
  end
end
