# frozen_string_literal: true

require 'tmpdir'

describe OfIf::Runner do
  subject(:runner) { described_class.new logger }

  let(:logger) { [] }
  let(:tmpdir) { Dir.mktmpdir }
  let(:sourcefile) { File.basename(__FILE__, '.*') }

  it 'prints progress' do
    runner.call
    expect(logger.last).to eq "Done\n"
  end

  it 'creates an image from sourcefile' do
    with_file_stubs(runner).call
    image_file = "#{tmpdir}/spec_lib_of_if_#{sourcefile}.png"

    expect(File).to exist(image_file)
  ensure
    FileUtils.remove_entry tmpdir
  end

  def with_file_stubs(runner)
    runner.source_files = ["spec/lib/of_if/#{sourcefile}.rb"]
    runner.target_dir = tmpdir
    runner
  end
end
