require 'rspec'
require 'converter'

RSpec.describe Converter do
  
  describe '.to_eur' do
    let(:converter) { Converter.new('1.00', 'USD') }
    it 'should display currency conversion to eur' do
      expect(converter.to_eur).to eq(0.85)
    end
  end

  describe '.to_usd' do
    let(:converter) { Converter.new('1.00', 'EUR') }
    it 'should display currency conversion to usd' do
      expect(converter.to_usd).to eq(1.18)
    end
  end

  describe 'to_rus' do
    let(:converter) { Converter.new('1.00', 'USD') }
    it 'should display currency conversion to rus' do
      expect(converter.to_rus).to eq(74.17)
    end
  end

  describe 'to_byn' do
    let(:converter) { Converter.new('1.00', 'USD') }
    it 'should display currency conversion to byn' do
      expect(converter.to_byn).to eq(2.45)
    end
  end

  describe 'self.convert' do
    let(:converter) { Converter.convert('1.00', 'USD', 'EUR') }
    it 'should display currency conversion from usd to eur' do
      expect(converter).to eq(0.85)
    end
  end
end
