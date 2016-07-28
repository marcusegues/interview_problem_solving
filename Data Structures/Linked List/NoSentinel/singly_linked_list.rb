require_relative './../singly_linked_list_node.rb'
require 'byebug'

class SinglyLinkedList
  attr_reader :head, :tail

  def initialize()
    @head = nil
    @tail = nil
  end

  def self.add_numbers(l1, l2)
    """
    Given two singly linked lists each representing a number (each node is a digit)
    add the numbers and output the result also as a singly linked list. The digits
    are stored in reverse order, with ones at the head.
    Time complexity: O(n), we're simply going through each list once
    Space complexity: O(n), we're creating the result in a new linked list
    """
    current1 = l1.head
    current2 = l2.head
    carry = 0
    sum = SinglyLinkedList.new
    while !current1.nil? || !current2.nil?
      if !current1.nil? && !current2.nil?
        result = current1.value + current2.value + carry
        if result >= 10
          carry = 1
          result -= 10
        else
          carry = 0
        end
        sum.insert_tail(result)
      else
        sum.insert_tail((current1.value || current2.value) + carry)
        carry = 0
      end
      current1 = current1.next_node if current1
      current2 = current2.next_node if current2
    end
    sum.insert_tail(carry) if carry > 0
    sum
  end

  def self.length(linkedList)
    current = linkedList.head
    count = 0
    until current.nil?
      count += 1
      current = current.next_node
    end
    count
  end

  def self.add_numbers_reverse(l1, l2)
    """
    Given two singly linked lists representing numbers (each node is a digit),
    add the two numbers, outputting the result in a singly linked list. This time,
    the most significant digit is stored at the head.
    Time complexity: O(n)
    Space complexity: O(n)
    """
    len1 = length(l1)
    len2 = length(l2)
    if len1 > len2
      self.add_padding(l2, len1 - len2)
    elsif len2 > len1
      self.add_padding(l1, len2 - len1)
    end
    current1 = l1.head
    current2 = l2.head
    sum = SinglyLinkedList.new
    previous = sum.head
    length(l1).times do
      current_sum = current1.value + current2.value
      if sum.empty? && current_sum >= 10  # carry on the most significant digits
        sum.insert(1)
        previous = sum.insert_tail(current_sum - 10)
      elsif current_sum >= 10
        previous.value += 1
        previous = sum.insert_tail(current_sum - 10)
      else
        previous = sum.insert_tail(current_sum)
      end
      current1 = current1.next_node
      current2 = current2.next_node
    end
    sum
  end

  def self.add_padding(linkedList, n)
    n.times do
      linkedList.insert(0)
    end
  end

  def self.cyclic?(linkedList)
    """
    Return true if the passed in linked list is cyclic, else false.
    Time complexity: O(n)
    Space complexity: O(1)
    """
    slow_runner, fast_runner = linkedList.head, linkedList.head
    return false if slow_runner.next_node.nil?
    until fast_runner.nil?
      fast_runner = fast_runner.next_node.next_node
      slow_runner = slow_runner.next_node
      return true if fast_runner == slow_runner
    end
    false
  end

  def self.find_circular_node(linkedList)
    """
    Find and return node at which a cycle begins in a linked list
    """
    slow_runner, fast_runner = linkedList.head, linkedList.head

    # only one node in the list, return nil
    return nil if slow_runner.nil? || slow_runner.next_node.nil?

    until fast_runner.nil?
      slow_runner = slow_runner.next_node
      fast_runner = fast_runner.next_node.next_node
      break if fast_runner == slow_runner
    end

    # return nil if the list isn't cyclic
    return nil if fast_runner.nil?

    slow_runner = linkedList.head
    until slow_runner == fast_runner
      slow_runner = slow_runner.next_node
      fast_runner = fast_runner.next_node
    end
    slow_runner
  end

  def palindrome?
    """
    Detect if a linked list is a palindrome. Calculates the length beforehand.
    Time complexity: O(n)
    Space complexity: O(n)
    """
    current = @head
    stack = []
    length = self.class.length(self)
    half_length = length / 2

    half_length.times do
      stack.push(current.value)
      current = current.next_node
    end

    if length.even?
      half_length.times do |i|
        return false if current.value != stack.pop
        current = current.next_node
      end
    else
      current = current.next_node
      half_length.times do
        return false if current.value != stack.pop
        current = current.next_node
      end
    end
    true
  end

  def palindrome?
    return nil if @head.nil?  # empty list
    return true if @head.next_node.nil?  # one element list
    if @head.next_node.next_node.nil?  # two element list
      if @head.next_node.value == @head.value
        return true
      else
        return false
      end
    end
    slow_runner, fast_runner = @head, @head
    stack = []
    until fast_runner.nil? || fast_runner.next_node.nil?
      stack << slow_runner.value
      slow_runner = slow_runner.next_node
      fast_runner = fast_runner.next_node.next_node
    end

    slow_runner = slow_runner.next_node unless fast_runner.nil?
    until stack.empty?
      return false if slow_runner.value != stack.pop
      slow_runner = slow_runner.next_node
    end
    true
  end

  def find_kth_to_last(k, node = @head)
    """
    Find kth to last node assuming we only have access to @head
    Time complexity: O(n)
    Space complexity: O(n)
    """
    return 0 if node.nil?
    result = find_kth_to_last(k, node.next_node)
    if result.class == Fixnum
      byebug
      result += 1
      return node if result == k
    end
    result
  end

  def find_kth_to_last_iterative(k)
  """
  Find kth to last node assuming we only have access to @head
  Time complexity: O(n)
  Space complexity: O(1)
  """
  n1, n2 = @head, @head
  (k-1).times { n2 = n2.next_node }
  return nil if n2.nil?
  loop do
    n2 = n2.next_node
    return n1 if n2.nil?
    n1 = n1.next_node
  end
  end

  def find_kth_to_last_node(k)
    """
    Find kth to last node assuming we have access to @tail
    Time complexity: O(n)
    Space complexity: O(1)
    """
    node = @tail
    (k-1).times { node = @tail.next_node }
  end

  def partition(value)
    """
    Partitions the list around value, such that all nodes < value come
    before nodes >= value
    Time complexity: O(n)
    Space complexity: O(1)
    """
    previous = @head
    return false if previous.nil?
    current = @head.next_node
    while current != nil
      if current.value < value
        delete_node_constant_time(current, previous)
        insert(current.value)
      else
        previous = current
      end
      current = current.next_node
    end
    true
  end



  def empty?
    @head == nil
  end

  def insert(value)
    """
    Time complexity: O(1)
    """
    new_node = SinglyLinkedListNode.new(value)
    @tail = new_node if @tail.nil?
    new_node.next_node = @head.nil? ? nil : @head
    @head = new_node
  end

  def insert_tail(value)
    """
    Time complexity: O(1)
    """
    new_node = SinglyLinkedListNode.new(value)
    @head = new_node if @head.nil?
    @tail.next_node = new_node unless @tail.nil?
    @tail = new_node
  end

  def delete_node(node)
    """
    Time complexity: O(n) because we must search for the previous node
    """
    previous = @head
    while !previous.nil? && previous.next_node != node
      previous = previous.next_node
    end
    return nil if previous.nil?
    previous.next_node = node.next_node
  end

  def delete(value)
    """
    O(n) because we must search for the value
    """
    found = find(value)
    return nil if found.nil?
    previous = found[:previous]
    delete_node = found[:found]
    delete_node_constant_time(delete_node, previous)
  end

  def delete_head
    return nil if @head.nil?
    @tail = @tail.next_node if @tail == @head
    deleted = @head
    @head = @head.next_node
    deleted
  end

  def delete_node_constant_time(node, previous)
    """
    Time complexity: O(1) because we give previous node as input
    """
    @tail = previous if node == @tail
    if previous.nil?
      @head = node.next_node
    else
      previous.next_node = node.next_node
    end
    node
  end

  def remove_duplicates
    """
    remove duplicates from a linked list object
    Time complexity: O(n)
    Space complexity: O(n)
    """
    seen = {}
    current = @head
    previous = nil
    while !current.nil?
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
    current = @head
    while !current.nil?
      runner = current.next_node
      previous = current
      while !runner.nil?
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
    return nil if @head.nil?
    prev = nil
    current = @head
    until current.nil?
      return {previous: prev, found: current} if current.value == value
      prev = current
      current = current.next_node
    end
    nil
  end

  def print
    current = @head
    until current.nil?
      puts current.value
      current = current.next_node
    end
  end

end
