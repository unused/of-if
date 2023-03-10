# frozen_string_literal: true

describe OfIf::Image do
  describe '#from_sourcefile' do
    subject(:image) { described_class.from_sourcefile sourcefile }

    let(:sourcefile) { file_fixture 'version.rb' }

    it 'extends heigth by lines of code' do
      expect(image.height).to eq 300
    end

    describe 'DEFAULTS' do
      it 'dynamically defines defaults' do
        min_width_default = OfIf::Image::DEFAULTS[:minimal_width]
        expect(image.minimal_width).to eq min_width_default
      end

      it 'allows override of defaults' do
        image.minimal_width = 7
        expect(image.minimal_width).to eq 7
      end
    end
  end
end
