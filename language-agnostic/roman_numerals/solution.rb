ROMAN_MAP = {
  1     => "I",
  4     => "IV",
  5     => "V",
  9     => "IX",
  10    => "X",
  40    => "XL",
  50    => "L",
  90    => "XC",
  100   => "C",
  400   => "CD",
  500   => "D",
  900   => "CM",
  1000  => "M"
}

def int_to_roman(input_int)

  result = ""
  return result if input_int < 1

  remainder = input_int
  ROMAN_MAP.keys.sort.reverse.each do |integer|
    while integer <= remainder do
      result.concat(ROMAN_MAP[integer])
      remainder = remainder - integer
    end
  end
  return result
end

require 'rspec/autorun'

RSpec.describe "#int_to_roman" do
  it "works for large numbers requiring repeated characters" do
    expect(int_to_roman(3611)).to eq("MMMDCXI")
  end
  it "works when handling a combination of 4s and 9s" do
    expect(int_to_roman(49)).to eq("XLIX")
  end
  it "works when handle 4s and 9s along with simpler digits" do
    expect(int_to_roman(492)).to eq("CDXCII")
  end
  it "works beyond the intuitive limit of 3999" do
    expect(int_to_roman(4000)).to eq("MMMM")
  end
  it "returns empty string for 0" do
    expect(int_to_roman(0)).to eq("")
  end
  it "returns empty string for negative numbers" do
    expect(int_to_roman(-1)).to eq("")
  end
end
