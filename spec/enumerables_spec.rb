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

describe "#my_none?" do
    it "it returns true if any array members don't meet the specifications." do
        expect(example_array.my_none? { |value| value < 0}).to be true
    end
    it "it returns true as long as array is empty even without block." do
        expect([].my_none?).to be true
    end
end
describe "#my_count" do
    it "it returns the total number of the array when no arg or block is passed." do
        expect(example_array.my_count).to be 7
    end
    it "it returns the number of the element present in the array." do
        expect(example_array.my_count(22)).to be 1
    end
    it "it returns 0 if no member of the arg is found." do
        expect(example_array.my_count(444)).to be 0
    end
    it "it returns the elements that satisfy the spec." do
        expect(example_array.my_count { |value| value%2 == 0}).to be 3
    end
end
describe "#my_map" do
    it "it returns the modified array from the spec." do
        expect(example_array.my_map { |value| value.to_s}).to eql(['2', '3', '59', '99', '203', '202', '22'])
    end
end
describe "#my_inject" do
    it "it returns the sum of all the numbers in the array." do
        expect(example_array.my_inject(:+)).to eql(590)
    end
    it "it returns the product of the numbers in the array." do
        expect(example_array.my_inject(:*)).to eql(31616118072)
    end
end
