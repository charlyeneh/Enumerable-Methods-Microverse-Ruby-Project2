require_relative '../enumerables'
require_relative './spec_helper'

RSpec.describe '#my_each' do
  arr = [1, 2, 3]
  it 'returns the iteration of the array' do
    expect(arr.my_each { |elem| (elem * 5) }).to eq(arr.each { |i| i.send('*', 5) })
  end
  it 'does not return iteration if no block is given, instead it returns an enumerator' do
    expect(arr.my_each).to be_an(Enumerator)
  end
end

RSpec.describe '.my_each_with_index' do
  it 'iterates over the object with its index and returns value of the given object' do
    hash = {}
    expect([1, 2, 3].my_each_with_index { |number, index| hash[number] = index }).to eql([1, 2, 3])
  end
  it 'does not return object if no block is given, instead it returns an enumerator' do
    expect([1, 2, 3].my_each_with_index).to be_an(Enumerator)
  end
end

RSpec.describe 'my_select' do
  it 'filters an array of objects' do
    expect([1, 2, 3].my_select { |n| n > 2 }).to eql([3])
  end
  it 'does not filter if no block is given, instead it returns an enumerator' do
    expect([1, 2, 3].my_select).to be_an(Enumerator)
  end
end

RSpec.describe 'my_all?' do
  it 'returns true if objects satisfy the given condition' do
    expect([1, 2, 3].my_all? { |n| n < 4 }).to eql(true)
  end
  it 'does not return true if an element equals false' do
    expect([1, nil, 3].my_all?).to eql(false)
  end
end

RSpec.describe 'my_any?' do
  it 'returns true if objects satisfy the given condition' do
    expect([1, 2, 3].my_any? { |n| n < 4 }).to eql(true)
  end
  it 'does not return true if objects do not satisfy the given condition' do
    expect([1, 2, 3].my_any? { |n| n > 4 }).to eql(false)
  end
end

RSpec.describe 'my_none?' do
  it 'returns true if any elements of an array equal false' do
    expect([nil, nil].my_none?).to eql(true)
  end
  it 'does not return true if any elements of an array equals true' do
    expect([1, nil].my_none?).to eql(false)
  end
end

RSpec.describe 'my_count' do
  it 'returns the number of elements in an array' do
    expect([1, 2, 3].my_count).to eql(3)
  end
  it 'does not return the sum of the elements in an array' do
    expect([0, 1, 2, 3].my_count).to eql(4)
  end
end

RSpec.describe 'my_map' do
  it 'returns a new array containing the values returned by the block' do
    expect([1, 2, 3].my_map { |n| n > 10 }).to eql([false, false, false])
  end
  it 'does not return new array if no block is given' do
    expect([1, 2, 3].my_map).to be_an(Enumerator)
  end
end

RSpec.describe 'my_inject' do
  it 'will pass each element and accumulate each sequentially' do
    expect([3, 6, 10].my_inject { |sum, number| sum + number }).to eql(19)
  end
  it 'does not multiply elements' do
    expect([1, 2, 3].my_inject { |sum, number| sum + number }).to eql(6)
  end
end

RSpec.describe 'multiply_els' do
  arr = [3, 6, 10]
  arr2 = [1, 2, 3]
  it 'multiplies elements of arrays' do
    expect(multiply_els(arr)).to eql(180)
  end
  it 'does not divide elements of arrays' do
    expect(multiply_els(arr2)).to eql(6)
  end
end