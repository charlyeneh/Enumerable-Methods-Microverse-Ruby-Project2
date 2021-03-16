describe my_each do
it "resturns the interation of the array if not blocj is given" do
  expect(array.my_each).to 
    enum = times.new
end

describe my_each_with_index do
    it "returns a value of a given object if no block is given" do
      expect(array.my_each_with_index).to eql(Enumerator)
    end
end

describe my_select do
  it "filters an array of objects" do
    expect([1, 2, 3].my_select {|n| n.even?}).to eql(2)
  end
end

describe my_all? do
  it "returns true if objects satisfy the given condition, else it returns false" do
    expect([1, 2, 3].my_all? {|n| n < 4}).to eql(true)
  end
end

describe my_any? do
  it "is identical to my_all? method" do
    expect([1, 2, 3].my_any? {|n| n > 4}).to eql(false)
  end
end

describe my_none? do
  it "is identical to my_any? method" do
    expect([nil, nil].my_none?).to eql(true)
  end
end

describe my_count do
  it "returns the number of characters in a string" do
    expect(["string"].my_count).to eql(6)
  end
end


end
