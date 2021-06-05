#!/usr/bin/ruby
#
# map_hours accepts pairs of numbers as start/end hours of a 24-hour day
# and builds an array describing ranges where '1' == active, '0' == inactive
#
def map_hours(*active)
  day = Array.new(24, 0)

  active.each do |range|
    start = range[0]
    finish = range[1]

    if finish > 23
      finish = 23
    end

    (start..finish).each do |hour|
      day[hour] = 1
    end
  end

  day
end

# Test Cases

# base case
puts map_hours()                == [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

# single ranges
puts map_hours([2,4])           == [0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
puts map_hours([10,10])         == [0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0]

# multiple ranges
puts map_hours([0,12], [14,15]) == [1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0,0,0,0,0,0,0]
puts map_hours([13,24],[0,12])  == [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
