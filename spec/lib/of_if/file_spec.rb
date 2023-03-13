# frozen_string_literal: true

describe OfIf::File do
  subject(:file) { described_class.new sourcepath }

  let(:sourcepath) { file_fixture 'version.rb' }

  it 'extracts all lines' do
    expect(file.lines.length).to eq 5
  end

  it 'detects indentation of lines' do
    expect(file.lines[3].indent_length).to eq 2
  end

  describe '#to_s' do
    it 'provides a printable summary' do
      expect("#{file}\n").to eq <<~SOURCE
        █████████████████████████████

        ███████████
          █████████████████
        ███
      SOURCE
    end
  end
end
