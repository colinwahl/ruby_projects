require "./cipher"

describe "caesar_cipher" do
  
  it "shifts 'hello' by 3" do
    caesar_cipher("hello", 3).should == "khoor"
  end

  it "handles spaces correctly" do
    caesar_cipher("hello world", 8).should == "pmttw ewztl"
  end

  it "correctly shifts by 26" do
    caesar_cipher("hello their kind world", 26).should == "hello their kind world"
  end
  
end
