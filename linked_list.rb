require_relative 'node.rb'

class LinkedList
  attr_accessor :list 

  def initialize
    @list = []
  end

  def append(value)
    new_node = Node.new(value)
    self.list.last.last_node = new_node
    self.list.push(new_node)
  end

  def prepend(value)
    self.list.unshift(Node.new(value, self.list.first))
  end

  def size 
    self.list.length
  end

  def head
    self.list.first
  end

  def tail
    self.list.last
  end

  def at(index)
    self.list[index]
  end

  def pop
    self.list.pop()
    self.list.last.next_node = nil
  end

  def contains?(value)
    self.list.any?{|node| node.value == value}
  end

  def find(value)
    self.list.each_with_index{|node, index| return index if node.value == value}
    nil
  end

  def to_s
    string = ""
    self.list.each do |node|
      unless node.value == nil
        string += "( #{node.value} ) -> "
      else
        string += "nil"
      end
      string
  end

  def insert_at(value, index)
    new_node =  Node.new(value, self.list[index].next_node)
    self.list[index].insert(new_node)
    self.list[index-1].next_node = new_node
  end

  def remove_at(index)
    self.list[index-1].next_node = self.list[index].next_node
    self.list.remove_at(index)
  end

end