# frozen_string_literal: true

require 'chunky_png'

module OfIf
  # Image renders a source file only by its indentation and obfuscates the code
  # by displaying only color blocks.
  class Image
    DEFAULTS = {
      margin: 100,
      char_width: 10,
      line_height: 20,
      minimal_width: 480
    }.freeze

    attr_reader :width

    def initialize
      @width = minimal_width
      @image_operations = []
      @current_line_index = 0
    end

    def self.from_sourcefile(sourcefile)
      file = File.new sourcefile

      new.tap do |image|
        file.lines.each { |line| image << line }
      end
    end

    def <<(line)
      @image_operations << create_image_operation(line, @current_line_index)
      update_width line.length
      @current_line_index += 1
    end

    def height = offset + (@current_line_index * line_height)

    def write(filename)
      png = ChunkyPNG::Image.new width, height, ChunkyPNG::Color::WHITE
      @image_operations.each { |op| op.call png }
      png.save filename
    end

    DEFAULTS.each_key do |attr_with_default|
      attr_writer attr_with_default

      define_method(attr_with_default) do
        instance_variable_get(:"@#{attr_with_default}") || \
          DEFAULTS[attr_with_default]
      end
    end

    private

    def update_width(length)
      @width = [@width, offset + (length * char_width)].max
    end

    # ChunkyPNG::Color::PREDEFINED_COLORS[:dimgrey]
    def comment_color = ChunkyPNG::Color.rgba(0, 0, 0, 55)

    # ChunkyPNG::Color::PREDEFINED_COLORS[:green]
    def code_color = ChunkyPNG::Color.rgba(0, 255, 0, 255)

    def border_color = ChunkyPNG::Color::TRANSPARENT

    def line_color(line)
      line.comment? ? comment_color : code_color
    end

    def offset = (2 * margin)

    def spacer = Integer(line_height / 3)

    def create_image_operation(line, line_index)
      lambda { |png|
        return if line.empty?

        from = rect_start_point line, line_index
        to = rect_end_point line, line_index
        png.rect from[0], from[1], to[0], to[1], border_color, line_color(line)
      }
    end

    def rect_start_point(line, index)
      [margin + (line.indent_length * char_width),
       margin + (index * line_height)]
    end

    def rect_end_point(line, index)
      [margin + (line.length * char_width) - spacer,
       margin + (index * line_height) + line_height - spacer]
    end
  end
end
