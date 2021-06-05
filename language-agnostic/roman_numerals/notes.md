## Interviewer notes

### Origin

http://rubyquiz.com/quiz22.html


### Things I look for

I keep the problem statement very broad and hope the candidate does the following before starting;
- work through some examples
  - e.g. what would 49, 492, 3611 translate to?
- ask about the upper and lower bounds of the input integer. I say that that "between 0-3999 is a fair range", but if
  they code they solution right, it should be able to handle any integer value.


Cases to test (let the candidate come up with them first, then supplement with these if necessary);
- negative integers (should return a sentinel value, null, empty string, whatever)
- 0 (treated same as negative integers)
- 4000

A lot of candidates end up having big switch-case statements for the different roman values that end up doing the same thing.
There is plenty of opportunity to consolidate the code into something that is less than 10 lines long.


### If the candidate gets stuck

The 4s and 9s is what trips most people up.
Suggest that we first try to handle cases that don't have 4s and 9s, then extend the solution later.
Of course, supporting 4s and 9s doesn't actually add any complexity if the solution is done right, but it tends to mentally trip people up and they always think they need to have special handling.

