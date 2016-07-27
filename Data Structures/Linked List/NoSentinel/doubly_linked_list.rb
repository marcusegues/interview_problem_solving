require 'byebug'
require_relative './../doubly_linked_list_node.rb'

class DoublyLinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def insert(value)
    """
    Time complexity: O(1)
    """
    node = DoublyLinkedListNode.new(value)
    node.next_node = @head
    node.prev_node = nil
    @tail = node if @tail.nil?
    @head.prev_node = node unless @head.nil?
    @head = node
  end

  def delete_node(node)
    """
    Time complexity: O(1)
    """
    if @tail == node
      @tail = node.prev_node
    else
      node.next_node.prev_node = node.prev_node
    end
    if @head == node
      @head = node.next_node
    else
      node.prev_node.next_node = node.next_node
    end

    node
  end

  def delete(value)
    """
    Time complexity: O(n) because has to find value
    excluding find, this is O(1)
    """
    found_node = find(value)
    return nil if found_node.nil?
    delete_node(found_node)
  end

  def remove_duplicates
    """
    remove duplicates from a linked list object
    Time complexity: O(n)
    Space complexity: O(n)
    """
    seen = {}
    current = @head
    while !current.nil?
      if seen[current.value]
        delete_node(current)
      else
        seen[current.value] = true
      end
      current = current.next_node
    end
  end

  def remove_duplicates_constant_space
    """
    remove duplicates from linked list object
    Time complexity: O(n^2)
    Space complexity: O(1)
    """
    current = @head
    while !current.nil?
      runner = current.next_node
      while !runner.nil?
        delete_node(runner) if runner.value == current.value
        runner = runner.next_node
      end
      current = current.next_node
    end
  end

  def find(value)
    """
    Time complexity: O(n)
    """
    current = @head
    until current.nil?
      return current if current.value == value
      current = current.next_node
    end
    nil
  end

  def print
    """
    Time complexity: O(n)
    """
    node = @head
    until node.nil?
      puts node.value
      node = node.next_node
    end
  end
end
