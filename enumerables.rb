module Enumerable
  def ca_each
    return to_enum unless block_given?
    example_array = is_a?(Array) ? self : to_a
    position_in_array = 0 
    while position_in_array < example_array.length
      yield example_array[position_in_array]
      position_in_array += 1
    end
      example_array
  end
end
  example_array = [2,3,59,99,203,202,22]
  example_array.ca_each {|number| puts number}

