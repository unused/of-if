# frozen_string_literal: true

module OfIf
  # Read a source file and provide each line with indentation and content
  # length.
  class File
    # Line responds to content and indentation length of a single line.
    Line = Struct.new(:raw) do
      def comment? = raw.lstrip.start_with?('#')
      def length = raw.length
      def content_length = raw.lstrip.length
      def indent_length = length - content_length
    end

    def initialize(path) = @path = path

    def lines
      @lines ||= ::File.readlines(@path).map { |line| Line.new(line.rstrip) }
    end

    def to_s
      lines.map do |line|
        "#{' ' * line.indent_length}#{'█' * line.content_length}"
      end.join "\n"
    end
  end
end
