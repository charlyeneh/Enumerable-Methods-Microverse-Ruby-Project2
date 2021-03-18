require_relative '../enumerables'
require_relative './spec_helper'

example_array = [2, 3, 59, 99, 203, 202, 22]
describe "#my_each" do
    it 'returns the iteration of the array' do
      expect(example_array.my_each { |number| p "Element number #{number}" }).to eql(example_array.each {|single| p "Element number #{single}"})
    end
end

describe "#my_each_with_index" do
    it "describes a members of an array with their index too." do
        expect(example_array.my_each_with_index { |number, index| p "Element number #{number} and #{index}"}).to eql(example_array.each_with_index{ |number, index| p "Element number #{number} and #{index}"})
    end
    
end

