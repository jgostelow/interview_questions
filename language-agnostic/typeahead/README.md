# Typeahead

There is a field on a webpage for a user to type the city in which they
currently live. As the user types, they see a list of the top five
recommendations based on the characters they've aleady added. The available
list of cities is constrained to U.S. cities.

For example, if a user types "an" into the field, the suggestions will be:

    Anaheim, California
    Anchorage, Alaska
    Ann Arbor, Michigan
    Antioch, California


## Your challenge

Create a function, class, or method in the language of your choice to recall
data from a list of US cities, which is currently stored in `cities.json`. Use
whatever data structures you would like.

At any point you are comfortable with doing so, there is a list of test
cases, stored in `tests.json`, to confirm the functionality of your work.


## Bonus Round 1

When you complete the tests above, add whatever necessary to this project to
create a lightweight REST API. This API should have one endpoint,
`GET /cities`, that will deliver the data from the challenge above.


## Bonus Round 2

Expose an endpoint, `POST /cities` that will add new data to the list of
possible matches.
