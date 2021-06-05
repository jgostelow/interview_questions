## Making Change

### Origin

http://rubyquiz.com/quiz154.html

### Problem

Write a function that returns how many of each coin is used when making change for a given amount.

The function should take two arguments;
- an integer 'amount'
- an integer array of coin 'denominations'
and should return a hash, where the;
- keys are the denominations
- values are how many of each denomination is needed

e.g.
args
- amount = 72
- denominations = [25, 10, 5, 1]

result: {
  25 => 2,
  10 => 2,
  5 => 0,
  1 => 2
}

72c => 2x25c, 2x10c, 2x1c
