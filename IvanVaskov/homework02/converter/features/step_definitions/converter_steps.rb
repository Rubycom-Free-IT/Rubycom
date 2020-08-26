Given('an instance of Converter with valid source data hash') do
  @data_hash = {
    "USD" => {
      "Cur_Scale" => 1,
      "Cur_Name" => "Доллар США",
      "Cur_OfficialRate" => 2.3898
    },
    "EUR" => {
      "Cur_Scale" => 1,
      "Cur_Name" => "Евро",
      "Cur_OfficialRate" => 2.7711
    }
  }
  @converter = Converter.new(@data_hash)
end

When('I call convert method with {int} {string} to {string}') do |amount, from, to|
  @result = @converter.convert(amount, from, to)
end

When('I try to convert {string} currency') do |currency|
  @result = @converter.convert(1, currency, currency)
end

Then('I should get {int} {string} equals {int} {string}') do |amount, from, value, to|
  expect(@result).
    to contain_exactly(Money.new(amount, from), Money.new(value, to))
end

Then('convert return nil') do
  expect(@result).to eq(nil)
end
