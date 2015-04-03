dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substrings(str, dict)
  substrings = Hash.new(0)

  str.downcase.split.each do |word|
    dict.each do |sub|
      if word[sub]
        substrings[sub] += 1
      end  
    end
  end
  return substrings
end


puts substrings("hello this is going to be the best ever hown partys partnersdfsf sits with meeee", dict).inspect

puts substrings("hi this going to be hornhow itilowownpartner sit with me", dict).inspect
