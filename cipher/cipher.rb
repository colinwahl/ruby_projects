def caesar_cipher(string, num)

  if num == 26 or num == 0
    return string
  end
  
  output = []
  string.each_char do |c|
    
    #check for spaces
    if c.ord == 32
      c = ' '
      output << c
      next
    end
    
    new_c = c.ord + num

    #keep characters the same case
    if new_c > 122 || (new_c > 90 and new_c < 97)
      c = (new_c - 26).chr
    else
      c = new_c.chr
    end

    output << c
  end
  return output.join
end

