# frozen_string_literal: true

module FixtureHelper
  def file_fixture(file)
    File.join 'spec', 'fixtures', file
  end
end
