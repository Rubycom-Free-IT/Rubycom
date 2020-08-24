require 'rspec'
require 'converter'

RSpec.describe Converter do
  describe '.to_eur' do
    context 'testing the Converter class' do
      it 'should display currency conversion in euro' do
        converter = Converter.new('1.00', 'USD')
        converter.to_eur
      end
    end
  end

  describe '.to_usd' do
    context 'testing the Converter class' do
      it 'should display currency conversion in usd' do
        converter = Converter.new('1.00', 'EUR')
        converter.to_usd
      end
    end
  end

  describe '.to_rus' do
    context 'testing the Converter class' do
      it 'should display currency conversion in rus' do
        converter = Converter.new('1.00', 'USD')
        converter.to_rus
      end
    end
  end

  describe '.to_byn' do
    context 'testing the Converter class' do
      it 'should display currency conversion in byn' do
        converter = Converter.new('1.00', 'USD')
        converter.to_byn
      end
    end
  end

  describe '.convert' do
    context 'testing the Converter class' do
      it 'should display currency conversion in euro' do
        Converter.convert('1.00', 'USD', 'EUR')
      end
    end
  end
end
