require 'json'
require 'colorize'
require 'money'
require 'rubocop'

class Converter
  attr_accessor :num_conv, :cur_name

  def initialize(num_conv, cur_name)
    @num_conv = num_conv
    @cur_name = cur_name
    begin
      current_path = File.dirname(__FILE__)
      file_path = File.read(current_path + '/converter.json')
    rescue StandardError
      puts 'File not found or damaged'
    end
    file_hash = JSON.parse(file_path)
    @cur_rate_eur = file_hash['currency'][0]['cur_rate']
    @cur_rate_usd = file_hash['currency'][1]['cur_rate']
    @cur_rate_rus = file_hash['currency'][2]['cur_rate']
    @cur_scale_rus = file_hash['currency'][2]['cur_scale']
    
    if cur_name.nil? || cur_name == '' || cur_name.is_a?(Integer) || cur_name == cur_name.downcase
      raise ArgumentError, 'Currency name entered incorrectly'
    elsif num_conv.nil? || num_conv == '' || num_conv.is_a?(Integer)
      raise ArgumentError, 'Currency amount entered incorrectly'
    elsif cur_name == 'RUS' && num_conv < '100'
      raise ArgumentError, 'Currency must be greater than 100'
    end
  end

  def to_eur
    cur_name == 'BYN' ? (num_conv.to_i / @cur_rate_eur).round(2) : 
    cur_name == 'USD' ? (to_byn / @cur_rate_eur).round(2) :
    cur_name == 'RUS' ? (to_byn / @cur_rate_eur).round(2) :
    'Currency not found'
  end

  def to_usd
    cur_name == 'BYN' ? (num_conv.to_i / @cur_rate_usd).round(2) :
    cur_name == 'EUR' ? (to_byn / @cur_rate_usd).round(2) :
    cur_name == 'RUS' ? (to_byn / @cur_rate_usd).round(2) :
    'Currency not found'
  end

  def to_rus
    cur_name == 'BYN' ? (num_conv.to_i * @cur_scale_rus / @cur_rate_rus).round(2) :
    cur_name == 'USD' ? (to_byn * @cur_scale_rus / @cur_rate_rus).round(2) :
    cur_name == 'EUR' ? (to_byn * @cur_scale_rus / @cur_rate_rus).round(2) :
    'Currency not found'
  end

  def to_byn
    cur_name == 'EUR' ? (num_conv.to_i * @cur_rate_eur).round(2) :
    cur_name == 'USD' ? (num_conv.to_i * @cur_rate_usd).round(2) :
    cur_name == 'RUS' ? (num_conv.to_i / @cur_scale_rus * @cur_rate_rus).round(2) :
    'Currency not found'
  end

  def self.convert(num_conv, cur_from, cur_to)
    converter = new(num_conv, cur_from)
  
    converter.public_send(:"to_#{cur_to.downcase}")
  end
end

converter = Converter.new('10', 'EUR')
puts converter.to_rus 
