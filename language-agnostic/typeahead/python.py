"""One potential approach to solving this problem using a dictionary lookup."""
import json


cities_dict = {}


def load_cities_dict():
    """Opens the cities.json file and parses it into a dictionary.
    The dictionary's keys are all possible combinations of text
    inputs that will result in one more city matches. The
    dictionary's values are list of cities corresponding to keys.
    For example:

    {
        'a': ['Abilene, Texas', 'Akron, Ohio', 'Albuquerque, New Mexico', ... ],
        'ab': ['Abilene, Texas'],
        'abi': ['Abilene, Texas'],
        ...
        'al': ['Albquerque, New Mexico', 'Alexandria, Virginia', 'Allentown, Pennsylvania'],
        ...
        'anaheim, california': ['Anaheim, California'],
        ...
    }
    """
    with open('cities.json') as json_file:
        json_data = json.load(json_file)

    cities = json_data['cities']

    global cities_dict

    for city in cities:
        # Split each city into a list of characters. For example,
        # Anaheim, California will result in the following:
        # ['A', 'n', 'a', 'h', 'e', ... ]
        chars = list(city)
        key = ''
        for char in chars:
            # Iterate over the city's characters and create successive
            # keys, for example:
            # 'a', 'an', 'ana', 'anah', 'anahe', ...
            key += char.lower()
            if key not in cities_dict:
                # If a key does not exist in our dictionary, add it.
                # Its value will be a list containing the respective
                # city. For example:
                # cities_dict['a'] = ['Anaheim, California']
                # cities_dict['an'] = ['Anaheim, California']
                # ...
                cities_dict[key] = [city]
            else:
                # If a key does exist in our dictionary, append the city
                # in question to the key's value (a list). For example:
                # cities_dict['a'] = ['Anaheim, California', 'Anchorage, Alaska']
                # cities_dict['an'] = ['Anaheim, California', 'Anchorage, Alaska']
                # ...
                cities_dict[key].append(city)


def typeahead(text):
    """This solution is O(1) since it's just a dictionary lookup."""
    text = text.lower()
    results = cities_dict[text]
    results.sort()
    return results[:5]


if __name__ == '__main__':
    load_cities_dict()
    results = typeahead('an')
    print(results)

    # Will print:
    #
    # ['Anaheim, California', 'Anchorage, Alaska', 'Ann Arbor, Michigan', 'Antioch, California']
