# To JSON

Implement the `to_json` function.
`def to_json(var)`

var can be;
- Integer
- String
- Symbol
- Array
- Hash
- nil

Hashes and Arrays may contain any combination of the above data types nested within them;
E.g.
```
{
  a: 1,
  b: [1,2,3,"4"],
  c: { m: 10, n: 11 },
  d: { o: [10, :fish, 12], p: 13, "q": nil, "20": 21 },
  e: [ 14, 15, {r: 16}, nil]
}
```
Expected : `{"a":1,"b":[1,2,3,"4"],"c":{"m":10,"n":11},"d":{"o":[10,"fish",12],"p":13,"q":null,"20":21},"e":[14,15,{"r":16},null]}`

There is no need to support object types that are not in the list above.

# Expected time

20-30 minutes

# Things to look for

- They may use the `to_json` method provided by the json gem only to test their results (In fact, you should encourage them to do so)
- This is a recursive exercise. At each level of the recursion, they should simply test the type then decide whether to recurse further (Arrays and Hashes) or print a value and return (Integer, String, Symbol, nil).
- Bonus points for using duck-typing instead of checking classes;
 `var.responds_to?(:each)` : true implies an Array or Hash, false implies one of the other types
- building a test function compares the results against the output of the to_json method from the json gem

# If they finish this quickly

- there isn't really much you can build on this if they get it working and it passes on the example above
- you could chat about what needs to be done to support user defined classes (the class must define `as_json` that returns a hash)
