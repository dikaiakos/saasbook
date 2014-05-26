
# Takes an array of integers as an argument and returns the sum of its 
#  elements. For an empty array it should return zero. 
def sum(array)

  raise 'array includes non integers' unless 
    (array.empty? || array.all? { |x|  x.integer?})
 
  array.reduce(0,:+)
   
end

puts "sum([]) ==> #{sum([])}"

# max_2_sum: takes an array of integers as an argument
# returns the sum of its two largest elements
def max_2_sum(array)

  raise 'array includes non integers' unless 
    (array.empty? || array.length == 1 || array.all? { |x|  x.integer?})

  case array.length
    when 0
       return 0
    when 1
       return array[0]
    else
       array_sorted = array.sort
       return array_sorted[array.length-2] + array_sorted[array.length-1]
    end
end

puts "max_2_sum([1,1,3,3]) ==> #{max_2_sum([1,1,3,3])}"

# sum_to_n?: takes an array of integers and an additional integer, n, as arguments 
# returns true if any two distinct elements in the array of integers sum to n
def sum_to_n?(array,n)

  raise 'parameters include non integers' unless 
    (array.empty? || array.length == 1 || n.integer? || array.all? { |x|  x.integer?})

  array.length.times do 
    y = array.shift
    if array.any? { |x| x + y == n } 
      return true
    end
  end
  return false
end

puts sum_to_n?([1, 2, 3, 4, 5], 5)
puts sum_to_n?([], 0)




