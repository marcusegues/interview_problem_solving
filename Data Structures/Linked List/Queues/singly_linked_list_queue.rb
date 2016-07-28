require_relative './../NoSentinel/singly_linked_list.rb'

class SinglyLinkedListQueue
  def initialize
    @list = SinglyLinkedList.new
  end

  def enqueue(value)
    @list.insert_tail(value)
  end

  def empty?
    @list.empty?
  end

  def dequeue
    return nil if empty?
    @list.delete_head
  end

  def peek
    @list.head
  end

  def print
    @list.print
  end

end
