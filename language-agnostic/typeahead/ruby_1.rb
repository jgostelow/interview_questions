# One potential approach to solving this problem using a hash lookup.
# The same methods are duplicated and annotated with comments
# further down below.
require 'json'

@cities_hash = {}

def load_cities
  json_file = File.read('cities.json')
  json_data = JSON.parse(json_file)
  cities = json_data['cities']

  cities.each do |city|
    chars = city.chars
    key = ''
    chars.each do |char|
      key += char.downcase
      symkey = key.to_sym
      if @cities_hash.key?(symkey)
        @cities_hash[symkey] << city
      elsif
        @cities_hash[symkey] = [city]
      end
    end
  end
end

def typeahead(text)
  text = text.downcase
  results =  @cities_hash[text.to_sym]
  results.sort!
  return results[0..4]
end

load_cities
results = typeahead('an')
puts results

# Will print:

# Anaheim, California
# Anchorage, Alaska
# Ann Arbor, Michigan
# Antioch, California

# ==================== With Comments ====================

def load_cities_comments
  # Opens the cities.json file and parses it into a hash. The
  # hash's keys are all possible combinations of text inputs
  # that will result in one more city matches. The hash's values
  # are lists of cities corresponding to keys.
  # For example:
  #
  # :a => ["Anaheim, California","Anchorage, Alaska", "Antioch, California",
  #       "Arvada, Colorado", "Aurora, Colorado", "Athens, Georgia",
  #       "Atlanta, Georgia", "Augusta, Georgia", "Aurora, Illinois",
  #       "Ann Arbor, Michigan", "Albuquerque, New Mexico", "Akron, Ohio",
  #       "Allentown, Pennsylvania", "Abilene, Texas", "Amarillo, Texas",
  #       "Arlington, Texas", "Austin, Texas", "Alexandria, Virginia"],
  # :an => ["Anaheim, California", "Anchorage, Alaska", "Antioch, California",
  #         "Ann Arbor, Michigan"],
  # :ana => ["Anaheim, California"],
  # :anah => ["Anaheim, California"], ...

  json_file = File.read('cities.json')
  json_data = JSON.parse(json_file)
  cities = json_data['cities']

  cities.each do |city|
    # Split each city into a list of characters. For example,
    # Anaheim, California will result in the following:
    # ['A', 'n', 'a', 'h', 'e', ... ]
    chars = city.chars
    key = ''
    chars.each do |char|
      # Iterate over the city's characters and create successive
      # keys, for example:
      # 'a', 'an', 'ana', 'anah', 'anahe', ...
      key += char.downcase
      symkey = key.to_sym
      if @cities_hash.key?(symkey)
        # If a key exists in our hash, append the city
        # in question to the key's value (an array
        # with other cities in it).
        @cities_hash[symkey] << city
      elsif
        # If a key does not exist in our hash, add it.
        # Its value will be an array containing the
        # respective city.
        @cities_hash[symkey] = [city]
      end
    end
  end
end

def typeahead_comments(text)
  # This solution is O(1) since it's just a hash lookup.
  text = text.downcase
  results =  @cities_hash[text.to_sym]
  results.sort!
  return results[0..4]
end
