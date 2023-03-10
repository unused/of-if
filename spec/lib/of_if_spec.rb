# frozen_string_literal: true

describe OfIf do
  it 'wraps a custom error class' do
    expect(defined?(OfIf::Error)).to be_truthy
  end
end
