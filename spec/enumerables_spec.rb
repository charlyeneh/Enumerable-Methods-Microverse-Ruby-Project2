require_relative '../enumerables'
require_relative './spec_helper'

describe my_each do
  let example_array = [2, 3, 59, 99, 203, 202, 22]
  it 'returns the iteration of the array' do
    expect(example_array.my_each { |number| p "Element number #{number}" }).to eql("Element number #{number}")
  end
end

  describe '#my_each' do
    context 'when no block is given it returns Enumerable' do
      it '#my_each' do
        expect(example_array.my_each).to be_an(example_array.to_enum.class)
      end
    end
  end

 describe '#my_each_with_index' do
  context 'returns the enumerator, if no block is given, else it hashes the items.' do
    it '#my_each_with_index' do
     expect([1, 2, 3].my_each_with_index { |_number, index| p index }).to eql(index)
    end
   end
 end 
 
# describe my_select do
#   it 'filters an array of objects' do
#     expect([1, 2, 3].my_select { |n| n.&:even? }).to eql(2)
#   end
# end

# describe my_all? do
#   it 'returns true if objects satisfy the given condition, else it returns false' do
#     expect([1, 2, 3].my_all? { |n| n < 4 }).to eql(true)
#   end
# end

# describe my_any? do
#   it 'is identical to my_all? method' do
#     expect([1, 2, 3].my_any? { |n| n > 4 }).to eql(false)
#   end
# end

# describe my_none? do
#   it 'is identical to my_any? method' do
#     expect([nil, nil].my_none?).to eql(true)
#   end
# end

# describe my_count do
#   it 'returns the number of characters in a string' do
#     expect(['string'].my_count).to eql(6)
#   end
# end

# describe my_map do
#   it 'returns a new array containing the values returned by the block' do
#     expect([1, 2, 3].my_map { |n| n > 10 }).to eql(false)
#   end
# end

# describe my_inject do
#   it 'will pass each element and accumulate each sequentially' do
#     expect([2, 3, 59, 99, 203, 202, 22].my_inject).to eql(316_161_180_72)
#   end
# end

# describe multiply_els do
#   it 'tests my_inject method' do
#     expect(multiply_els([2, 3, 59, 99, 203, 202, 22])).to eql(316_161_180_72)
#   end
# end
