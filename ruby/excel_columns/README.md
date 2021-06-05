## Convert a column index to an Excel column name

You'll need RSpec (`gem install rspec`).  Run `rspec spec ruby/excel_columns/problem.rb` to check your work.

Write a function `alphabetize`, which takes in an 0-indexed integer representing the column, and returns the string representing that column in Excel.

| int | column name |
| ----|:------------|
| 0   | "A"         |
| 1   | "B"         |
| 2   | "C"         |
| 25  | "Z"         |
| 26  | "AA"        |
| 27  | "AB"        |
| 28  | "AC"        |
| 51  | "AZ"        |
| 52  | "BA"        |
| 53  | "BB"        |
| 54  | "BC"        |
| 77  | "BZ"        |
| 676 | "ZA"        |
| 677 | "ZB"        |
| 678 | "ZC"        |
| 701 | "ZZ"        |
| 702 | "AAA"       |
| 703 | "AAB"       |
| 704 | "AAC"       |
| 727 | "AAZ"       |
| 728 | "ABA"       |
| 729 | "ABB"       |
| 730 | "ABC"       |