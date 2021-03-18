require_relative '../enumerables'
require_relative './spec_helper'

RSpec.describe '#my_each' do
  arr = [1, 2, 3]
  it 'returns the iteration of the array' do
    expect(arr.my_each { |elem| (elem * 5) }).to eq(arr.each { |i| i.send('*', 5) })
  end
end

RSpec.describe '.my_each_with_index' do
  it 'returns the enumerator if no block is given, else it hashes the items.' do
    hash = {}
    expect([1, 2, 3].my_each_with_index { |number, index| hash[number] = index }).to eql([1, 2, 3])
  end
end

RSpec.describe 'my_select' do
  it 'filters an array of objects' do
    expect([1, 2, 3].my_select { |n| n > 2 }).to eql([3])
  end
end

RSpec.describe 'my_all?' do
  it 'returns true if objects satisfy the given condition, else it returns false' do
    expect([1, 2, 3].my_all? { |n| n < 4 }).to eql(true)
  end
end

RSpec.describe 'my_any?' do
  it 'is identical to my_all? method' do
    expect([1, 2, 3].my_any? { |n| n > 4 }).to eql(false)
  end
end

RSpec.describe 'my_none?' do
  it 'is identical to my_any? method' do
    expect([nil, nil].my_none?).to eql(true)
  end
end

RSpec.describe 'my_count' do
  it 'returns the number of elements in an array' do
    expect([1, 2, 3].my_count).to eql(3)
  end
end

RSpec.describe 'my_map' do
  it 'returns a new array containing the values returned by the block' do
    expect([1, 2, 3].my_map { |n| n > 10 }).to eql([false, false, false])
  end
end

RSpec.describe 'my_inject' do
  it 'will pass each element and accumulate each sequentially' do
    expect([3, 6, 10].my_inject { |sum, number| sum + number }).to eql(19)
  end
end
