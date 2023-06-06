require_relative 'linked_list.rb'

list1 = LinkedList.new()
list2 = LinkedList.new()

puts "append:"
for i in 0..6 
  list1.append(i)
end
puts list1

puts "prepend:"
for i in 0..4 
  list2.prepend(i)
end
puts list2

puts 
puts "list: #{list1}"
puts "size: #{list1.size}"

puts "head: #{list1.head}"
puts "tail: #{list1.tail}"

puts "at(index = 1): #{list1.at(1)}"

list1.pop
puts "pop: #{list1}"

puts "contains?(3): #{list1.contains?(3)}"
puts "contains?(8): #{list1.contains?(8)}"

puts "find(3): #{list1.find(3)}"
puts "find(8): #{list1.find(8)}"

list1.insert_at(99,2)
puts "insert_at(99, 2): #{list1}"
puts
list1.insert_at("hi", 0)
puts "insert_at('hi', 0): #{list1}"
puts
list1.insert_at('world', 8)
puts "insert_at('world', 8): #{list1}"
puts
list1.insert_at(456, 10)
puts "insert_at(456, 10): #{list1}"

list1.remove_at(0)
puts "remove_at(0): #{list1}"

list1.remove_at(10)
puts "remove_at(10): #{list1}"

list1.remove_at(4)
puts "remove_at(4): #{list1}"

list1.remove_at(7)
puts "remove_at(7): #{list1}"