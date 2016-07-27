require_relative './../doubly_linked_list_node.rb'

class DoublyLinkedListSentinel
  attr_reader :nil_node
  def initialize
    @nil_node = DoublyLinkedListNode.new(nil)
    @nil_node.next_node = @nil_node
    @nil_node.prev_node = @nil_node
  end

  def insert(value)
    """
    Insert at head (@nil_node.next_node position)
    Time complexity: O(1)
    """
    new_node = DoublyLinkedListNode.new(value)
    new_node.next_node = @nil_node.next_node
    new_node.next_node.prev_node = new_node
    new_node.prev_node = @nil_node
    @nil_node.next_node = new_node
  end

  def delete_node(node)
    """
    Time complexity: O(1)
    """
    node.prev_node.next_node = node.next_node
    node.next_node.prev_node = node.prev_node
    node
  end

  def delete(value)
    """
    Time complexity: O(n) because we must find the value
    """
    found_node = find(value)
    return nil if found_node == @nil_node
    delete_node(node)
  end

  def remove_duplicates
    """
    remove duplicates from a linked list object
    Time complexity: O(n)
    Space complexity: O(n)
    """
    seen = {}
    current = @nil_node.next_node
    while current != @nil_node
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
    current = @nil_node.next_node
    while current != @nil_node
      runner = current.next_node
      while runner != @nil_node
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
    current = @nil_node.next_node
    while current != @nil_node && current.value != value
      current = current.next_node
    end
    current
  end

  def print
    """
    Time complexity: O(n)
    """
    current = @nil_node.next_node
    until current == @nil_node
      puts current.value
      current = current.next_node
    end
  end

end
