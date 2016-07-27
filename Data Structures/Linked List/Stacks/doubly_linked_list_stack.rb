require_relative './../doubly_linked_list.rb'

class LinkedListStack
  def initialize
    @list = DoublyLinkedList.new
  end

  def push(value)
    # O(1) because inserting into a LinkedList is O(1)
    @list.insert(value)
  end

  def pop
    # O(1) because we are deleting the first element in a
    # LinkedList if there is one
    raise "Stack underflow" if @list.head.nil?
    @list.delete(@list.head.value)
  end

  def print
    # O(n)
    @list.print_list
  end
end
