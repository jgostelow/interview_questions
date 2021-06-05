## Convert an integer to Roman Numbers

Write a function, that given an integer argument, returns a string which is the Roman Numeral representation of the input integer.

e.g.
```
int_to_roman(3)
=> "III"
```

Expectations;

1/ Focus on delivering something that works as quickly as possible. If we have time, then we should iterate toward a solution you would be happy to release to production.

2/ Test your code. RSpec is available. The code above contains an example.

3/ It is up to you to prove to me that your solution works as expected for all inputs.

Here is the dictionary of roman numerals


| int   | roman numeral |
| ------|:--------------|
| 1     |  I            |
| 4     |  IV           |
| 5     |  V            |
| 9     |  IX           |
| 10    |  X            |
| 40    |  XL           |
| 50    |  L            |
| 90    |  XC           |
| 100   |  C            |
| 400   |  CD           |
| 500   |  D            |
| 900   |  CM           |
| 1000  |  M            |

Here is a sample rspec test they could use to test their code;
```
require 'rspec/autorun'

RSpec.describe "#int_to_roman" do
  it "returns the correct value for a simple case" do
    expect(int_to_roman(3)).to eq("III")
  end
end
```
