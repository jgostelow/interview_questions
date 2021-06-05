## Interviewers notes

Typically, I would only expect a candidate to get the simple solution. That is enough for me to give a thumbsup for
them.

There is a much more complex solution if we add the requirement that we want to return the minimum number of coins to
make up the amount, and we tweak the input denominations.
For example;
- amount : 14
- denominations : [25,10,7,5,1]
- brute force result: {10=>1, 1=>4}
- optimal result: {7=>2}

The optimal solution requires dynamic programming to memoize multiple solutions and pick the best one.
You can read more about the optimal solution at http://rubyquiz.com/quiz154.html
I would only give this if the candidate blows through the simple solution and there is plenty of time to spare.
