def stock_picker(days)
  hi = nil
  low = nil
  profit = 0
  i = 0
  
  while i < days.length do 
    k = i + 1
    while k < days.length do  
      if days[k] - days[i] > profit 
        low = i
        hi = k
        profit = days[k] - days[i]
      end
      k += 1
    end
    i += 1
  end
  return [days[low], days[hi]]  
end
