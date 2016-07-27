require_relative './../singly_linked_list.rb'

class LinkedListQueue
  def initialize
    @list = SinglyLinkedList.new
  end

  def enqueue(value)
    @list.insert(value)
  end

  def empty?
    @list.empty?
  end

  def dequeue
    raise "Queue underflow" if empty?
    @list.delete(@list.tail.value)
  end

  def print
    @list.print
  end

end
