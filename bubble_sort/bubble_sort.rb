def bubble_sort(array)
  n = array.length
  loop do
    swapped = false
    for i in 1..n-1 do
      if array[i-1] > array[i]
        array[i-1], array[i] = array[i], array[i-1]
        swapped = true
      end
    end
    break if not swapped
  end
  array
end

def bubble_sort_by
  #todo implement part 2
end

p bubble_sort([2, 3, 4, 1, 2, 3, 4, 5])
p bubble_sort([7, 6, 5, 4, 9, 3, 124, 75, 234, 754, 43, 63, 654])
p bubble_sort([12, 4567, 23, 54643, 5643, 745, 43333333, 4775, 3543, 86778, 45646])
