require_relative '../enumerables'
require_relative './spec_helper'

example_array = [2, 3, 59, 99, 203, 202, 22]
describe "#my_each" do
    it 'returns the iteration of the array' do
      expect(example_array.my_each { |number|  "Element number #{number}" }).to eql(example_array.each {|single|  "Element number #{single}"})
    end
end

describe "#my_each_with_index" do
    it "describes a members of an array with their index too." do
        expect(example_array.my_each_with_index { |number, index|  "Element number #{number} and #{index}"}).to eql(example_array.each_with_index{ |number, index|  "Element number #{number} and #{index}"})
    end
end

describe "#my_select" do
    it "select a selection from an array." do
        expect(example_array.my_select { |value|  "#{value} selected from the array."}).to eql(example_array.select { |value|  "#{value} selected from the array."})
    end 
end

describe "#my_all?" do
    it "it returns true if all array members meet the specifications." do
        expect(example_array.my_all? { |value| value > 0}).to be true
    end
    it "it returns true array is empty." do
        expect([].my_all? { |value| value > 0}).to be true
    end
end

describe "#my_any?" do
    it "it returns true if any array members meet the specifications." do
        expect(example_array.my_any? { |value| value > 10}).to be true
    end
    it "it returns true as long as array is not empty even without block." do
        expect(example_array.my_any?).to be true
    end
end




