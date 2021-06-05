def make_change(amount, denominations)

	result = {}
	remainder = amount

	denominations.sort.reverse.each do |denom|
		result[denom] ||= 0
		while denom <= remainder do
			result[denom] += 1
			remainder = remainder - denom
		end
	end
	return result
end

require 'rspec/autorun'

RSpec.describe "#make_change" do

	# US
  it "should work when multiple coins per denomination are needed" do
		expect(make_change(72, [25, 10, 5, 1])).to eq({25=>2, 10=>2, 5=>0, 1=>2})
	end
  it "should return no coins when the value is 0" do
		expect(make_change(0, [25, 10, 5, 1])).to eq({25=>0, 10=>0, 5=>0, 1=>0})
	end
  it "should return a single penny when value is 1" do
		expect(make_change(1, [25, 10, 5, 1])).to eq({25=>0, 10=>0, 5=>0, 1=>1})
	end
  it "should return no coins when the value is negative" do
    expect(make_change(-1, [25, 10, 5, 1])).to eq({25=>0, 10=>0, 5=>0, 1=>0})
	end
  it "should work when the input denominations are not ordered" do
		expect(make_change(72, [10, 25, 1, 5])).to eq({25=>2, 10=>2, 5=>0, 1=>2})
	end
  it "should deduplicate the input denominations" do
		expect(make_change(72, [25, 25, 10, 5, 5, 1])).to eq({25=>2, 10=>2, 5=>0, 1=>2})
	end
	it "should return an empty hash if no denominations are specified" do
		expect(make_change(72, [])).to eq({})
	end
	# AUD
	it "should work for non-US denominations" do
		expect(make_change(72, [50, 20, 10, 5, 1])).to eq({50=>1, 20=>1, 10=>0, 5=>0, 1=>2})
	end
  it "should return 0 coins for value 0, even when using non-US denominations" do
		expect(make_change(0, [50, 20, 10, 5, 1])).to eq({50=>0, 20=>0, 10=>0, 5=>0, 1=>0})
	end
  it "should return no coins when the value is negative, even when using non-US denominations" do
    expect(make_change(-1, [50, 20, 10, 5, 1])).to eq({50=>0, 20=>0, 10=>0, 5=>0, 1=>0})
	end

end
