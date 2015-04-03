require "./stocks"

describe "stock_picker" do 

  it "[0, 1, 2 , 3, 0, 9, 100, 0, 1]" do
    stock_picker([0, 1, 2 , 3, 0, 9, 100, 0, 1]).should == [0, 100]
  end

  it "[100, 1, 2 , 3, 0, 9, 0, 0, 0]" do
    stock_picker([100, 1, 2 , 3, 0, 9, 0, 0, 0]).should == [0, 9]
  end

  it "[1, 2, 7, 100, 0, 1899]" do
    stock_picker([1, 2, 7, 100, 0, 1899]).should == [0, 1899]
  end

  it "[0, 0, 0, 100]" do
    stock_picker([0, 0, 0, 100]).should == [0, 100]
  end


end
