# Another potential approach to solving this problem using multiple hash lookups.
# This is jankier than the approach in ruby_1.rb
# The same methods are duplicated and annotated with comments
# further down below.
require 'json'

@cities_hash = {}

def load_cities
  json_file = File.read('cities.json')
  json_data = JSON.parse(json_file)
  @cities = json_data['cities']
  
  @cities.each do |city|
    build_hash(city, nil, @cities_hash)
  end
end

def build_hash(city, chars, hash)
  chars = city.chars if chars.nil?

  return if chars.length == 0

  char = chars[0].downcase.to_sym
  if hash.key?(char)
    hash[char][:cities] << city
  else
    hash[char] = {cities: [city]}
  end

  build_hash(city, chars[1..chars.length], hash[char])
end

def typeahead(text)
  text = text.downcase
  chars = text.chars

  hash = @cities_hash
  chars.each do |char|
    hash = hash[char.to_sym]
  end

  results = hash[:cities]
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
  # Opens the cities.json file and parses it into an array of cities.
  # It then builds loops over the cities array and builds a hash.
  json_file = File.read('cities.json')
  json_data = JSON.parse(json_file)
  @cities = json_data['cities']
  
  @cities.each do |city|
    build_hash(city, nil, @cities_hash)
  end
end

def build_hash_comments(city, chars, hash)
  # Recursively builds a hash where the keys are single letters and the
  # values are increasingly nested hashes.
  # For example:
  # 
  # :a => {
  #   :cities => ["Anaheim, California", "Anchorage, Alaska", "Antioch, California",
  #               "Arvada, Colorado", "Aurora, Colorado", "Athens, Georgia", "Atlanta, Georgia",
  #               "Augusta, Georgia", "Aurora, Illinois", "Ann Arbor, Michigan",
  #               "Albuquerque, New Mexico", "Akron, Ohio", "Allentown, Pennsylvania",
  #               "Abilene, Texas", "Amarillo, Texas", "Arlington, Texas", "Austin, Texas",
  #               "Alexandria, Virginia"],
  #   :n => {
  #     :cities => ["Anaheim, California", "Anchorage, Alaska", "Antioch, California",
  #                 "Ann Arbor, Michigan"],
  #     :a => {
  #       :cities => ["Anaheim, California"],
  #       :h => {
  #         :cities => ["Anaheim, California"],
  #         :e => { ...

  chars = city.chars if chars.nil?

  # Break out of recursion once we're done parsing a city's characters.
  return if chars.length == 0

  char = chars[0].downcase.to_sym
  if hash.key?(char)
    # If a character exists in our hash, add the city
    # to the array corresponding to the character.
    hash[char][:cities] << city
  else
    # If a charcter does not exist in our hash, add it
    # and also add an array populated with the city.
    hash[char] = {cities: [city]}
  end

  # Continue building the hash. Two important things to note
  # in the next invocation of this method:
  # 1. Pass it an array of characters starting from current
  # character + 1
  # 2. Pass it the nested hash we created in the code block
  # just above
  build_hash(city, chars[1..chars.length], hash[char])
end

def typeahead_comments(text)
  text = text.downcase
  chars = text.chars

  # Traverse through our nested hashes to find the
  # results. For example, inputing 'an' will
  # look in @cities_hash[:a][:n][:cities]
  hash = @cities_hash
  chars.each do |char|
    hash = hash[char.to_sym]
  end

  results = hash[:cities]
  results.sort!

  return results[0..4]
end
