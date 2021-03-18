require_relative '../enumerables'
require_relative './spec_helper'

#   describe "#my_each"
#     it "should return each item in an array" do
#         expect([2, 4, 6, 8, 10].my_each { |number| p "Element number #{number}" ) to eql("Element number #{number}")
#     end
#   end

describe "#my_each" do
    example_array = [2, 3, 59, 99, 203, 202, 22]
    it 'returns the iteration of the array' do
      expect(example_array.my_each { |number| p "Element number #{number}" }).to eql(example_array.each {|single| p "Element number #{single}"})
    end
  end
