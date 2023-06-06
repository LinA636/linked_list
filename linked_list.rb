require_relative 'node.rb'

class LinkedList
  attr_accessor :list 

  def initialize
    @list = []
  end

  def append(value)
    if self.list.empty?
      self.list.push(Node.new(value))
    else
      new_node = Node.new(value)
      self.list.last.next_node = new_node
      self.list.push(new_node)
    end
  end

  def prepend(value)
    if self.list.empty?
      self.list.unshift(Node.new(value))
    else
      self.list.unshift(Node.new(value, self.list.first))
    end
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
    self.list = self.list[0..-2]
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
    if list.empty?
      return "nil"
    else
      string = ""
      self.list.each do |node|
        if node.next_node == nil
          string += "( #{node.value} ) ->  nil"
        else
          string += "( #{node.value} ) -> "
        end
      end
      string
    end
  end

  def insert_at(value, index)
    if index == 0
      prepend(value)
    elsif index > self.list.size-1
      append(value)
    else
      new_node =  Node.new(value, self.list[index].next_node)
      self.list = self.list[0..index-1] + [new_node] + self.list[index..-1]
      self.list[index-1].next_node = new_node
    end
  end

  def remove_at(index)
    if index == 0
      self.list = self.list[1..-1]
    elsif 0 < index && index < self.list.size
      self.list[index-1].next_node = self.list[index].next_node
      self.list = self.list[0..]
      self.list = self.list[0..index-1] + self.list[index+1..-1]
    end
  end

end