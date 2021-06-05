require 'rspec'

# This problem is basically converting from base-10 to base-26, except we just use letters instead of letters and numbers.
# It's appropriate for people with lots of math, or a traditional CS background (where they give you homework on converting between bases all the time).  It's probably an unfair question for someone without that background - not unsolvable, but it's not really a fair test of problem solving for them.
#
# In base-10, we have the one's place, ten's place, hundred's place, etc.  We use ten digits, 0 - 9.
#
# So if we wanted to break a base-10 number into individual digits (say, 543 to [5, 4, 3]), we could do it like this.
#
# First, let's figure out how to get the 3.  The digit in the one's place is basically whatever's left after we divide by 10.  If it were divisible by 10, it'd have to be at least 2 digits long.  The modulo operator (`%` in Ruby) can get us the remainder.
#
# 543 % 10 is 3, so we're good.
#
# We're left with 540, now that we've identified that 3 is the last digit.  We really want to parse the digits of 54, not 540, so we can divide by 10 to get 54.
#
# 54 also has a digit in the one's place.  And it's the digit we wanted to get next anyway.  So we can repeat the process we used to find the 3.
#
# 54 % 10 is 4, so we're good again.  Now we repeat the process with 5.
#
# 5 % 10 is just 5, and we can stop now.  When you divide the number by 10 and get 0, there's nothing left to do.
#
# The process is the same for base-26; get the remainder of division by 26, and repeat the process with the result of dividing by 26.  We'll know we're done when we divide by 26 and get 0.

module Excel
    # We can easily map column indices to letters by putting all the letters in order in an array.
    #
    # LETTERS[0] gives us "A", etc.
    LETTERS = ('A'..'Z').to_a

    def self.alphabetize(column, result=[])
        result << LETTERS[column % 26]
        rest = column / 26

        if rest > 0
            # Why subtract 1?
            #
            # Excel goes from "Z" to "AA", which in base-10 terms would be a bit like the number after 9 being 00.
            # So to make up for that difference, we subtract 1 from each digit in the ten's place.
            alphabetize(rest - 1, result)
        else
            # Our result array will look like ['C', 'A'] for a column of 28, since we appended to the end.  So we have to reverse the list first.
            result.reverse.join
        end
    end
end

describe Excel do
    describe '::alphabetize' do
        it 'returns correct output' do
            cases = {
                0 => 'A',
                1 => 'B',
                2 => 'C',
                25 => 'Z',
                26 => 'AA',
                27 => 'AB',
                28 => 'AC',
                51 => 'AZ',
                52 => 'BA',
                53 => 'BB',
                54 => 'BC',
                77 => 'BZ',
                676 => 'ZA',
                677 => 'ZB',
                678 => 'ZC',
                701 => 'ZZ',
                702 => 'AAA',
                703 => 'AAB',
                704 => 'AAC',
                727 => 'AAZ',
                728 => 'ABA',
                729 => 'ABB',
                730 => 'ABC'
            }

            expect(cases.map { |column, _| Excel.alphabetize(column) }).to eq(cases.values)
        end
    end
end