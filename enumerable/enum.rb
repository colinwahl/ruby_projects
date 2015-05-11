module Enumerable
  def my_each
    return self unless block_given?
    for elem in self do 
      yield elem
    end
    self
  end
  
  def my_each_with_index
    return self unless block_given?
    n = 0
    for elem in self do
      yield(elem, n)
      n += 1
    end
    self
  end
  
  def my_select
    return self unless block_given?
    array = []
    self.my_each do |elem|
      if yield elem
        array.push(elem)
      end
    end
    array
  end

  def my_all?
    return false unless block_given?
    self.my_each do |elem|
      unless yield elem
        return false
      end
    end
    true
  end
  
  def my_any?
    return false unless block_given?
    self.my_each do |elem|
      if yield elem
        return true
      end
    end
    false
  end
  
  def my_none?
    return false unless block_given?
    self.my_each do |elem|
      if yield elem
        return false
      end
    end
    true
  end
  
  def my_count
    return self.size unless block_given?
    count = 0
    self.my_each do |elem|
      if yield elem
        count += 1
      end
    end
    count
  end
  
  def my_map
    return self unless block_given?
    arr=[]
    self.my_each do |elem|
      arr.push yield elem
    end
    arr
  end

end

array = [1, 2, 2, 2, 5, 6, 7]

array.my_each { |num| print num }

array.my_each_with_index { |num, index| puts "#{index}: #{num}" }

p array.my_select { |element| element == 2 }

p array.my_all? { |element| element.is_a? Integer }

p array.my_any? { |element| element.is_a? Symbol }

p array.my_none? { |element| element.is_a? Integer }

p array.my_count { |element| element.is_a? Integer }

p array.my_map { |element| element += 2 }
