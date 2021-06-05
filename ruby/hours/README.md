# Hours

This problem was based on a thought exercise to simplify parts of [DayAvailability calculation][1].

For purposes of a coding problem, using 0s and 1s to represent hours is easier on the eyes
than boolean values.

Rather than relying on any specific test framework, test cases simply output 'true' / 'false'.
The goal is to run the code and have all output return 'true'.

# Expected time

10-20 minutes

# Things to look for

1. The base case should be straightforward and show basic use of Ruby idioms.
2. Look for unwrapping arguments and to what extent argument checks are needed.
3. Final test cases assume arguments aren't ordered.
4. What additional test cases are needed?
5. What assumptions need to be made or provided?

# Next steps

If there's time, some things to think about:

- how would this solution change to account for an entire week?
- what issues would come up if applying this to a real calendar (ie. DST, holidays)
