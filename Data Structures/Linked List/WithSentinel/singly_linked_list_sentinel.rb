require_relative './../singly_linked_list_node.rb'

class SinglyLinkedListSentinel
  attr_reader :nil_node
  def initialize
    @nil_node = SinglyLinkedListNode.new
    @nil_node.next_node = @nil_node
  end

  def empty?
    @nil_node.next_node == @nil_node
  end

  def insert(value)
    """
    Time complexity: O(1) because we insert at the head (nil_node.next_node)
    """
    new_node = SinglyLinkedListNode.new(value)
    new_node.next_node = @nil_node.next_node
    @nil_node.next_node = new_node
  end

  def delete_node(node)
    """
    O(n) because has to search for previous node
    """
    previous = @nil_node
    while previous.next_node != @nil_node && previous.next_node != node
      previous = previous.next_node
    end
    return nil if previous.next_node == @nil_node
    previous.next_node = node.next_node
  end

  def delete_node_constant_time(node, previous)
    """
    O(1) because we already give previous node as input
    """
    return nil if node == @nil_node || previous.next_node != node
    previous.next_node = node.next_node
  end

  def delete(value)
    """
    O(n) because we must search for the value
    """
    nodes = find(value)
    previous = nodes[:prev]
    to_delete = nodes[:found]
    delete_node_constant_time(to_delete, previous)
  end

  def remove_duplicates
    """
    remove duplicates from a linked list object
    Time complexity: O(n)
    Space complexity: O(n)
    """
    seen = {}
    current = @nil_node.next_node
    previous = @nil_node
    while current != @nil_node
      if seen[current.value]
        delete_node_constant_time(current, previous)
      else
        seen[current.value] = true
        previous = current  # only update previous if current has not just been deleted
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
    current = @nil_node.next_node
    while current != @nil_node
      runner = current.next_node
      previous = current
      while runner != @nil_node
        if runner.value == current.value
          delete_node_constant_time(runner, previous)
        else
          previous = runner
        end
        runner = runner.next_node
      end
      current = current.next_node
    end
  end

  def find(value)
    """
    Time complexity: O(n)
    """
    prev = @nil_node
    current = @nil_node.next_node
    while current != @nil_node && current.value != value
      prev = current
      current = current.next_node
    end
    {prev: prev, found: current}
  end

  def print
    current = @nil_node.next_node
    until current == @nil_node
      puts current.value
      current = current.next_node
    end
  end
end
