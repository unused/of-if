# frozen_string_literal: true

require 'tmpdir'

describe OfIf::Runner do
  subject(:runner) { described_class.new logger }
  let(:logger) { [] }
  let(:tmpdir) { Dir.mktmpdir }
  let(:sourcefile) { File.basename(__FILE__).split('.')[0] }

  it 'prints progress' do
    runner.()
    expect(logger.last).to eq "Done\n"
  end

  it '' do
    runner.source_files = [sourcefile]
    runner.target_dir = tmpdir
    runner.()
    image_file = "#{tmpdir}/#{sourcefile}.png"

    require 'pry'; binding.pry
    expect(File.exist?(image_file)).to be_truthy
  ensure
    FileUtils.remove_entry tmpdir
  end
end
