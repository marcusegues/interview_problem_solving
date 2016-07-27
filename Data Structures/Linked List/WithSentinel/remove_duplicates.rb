def remove_duplicates(linkedList)
  """
  remove duplicates from linked list object
  Time complexity: O(n^2)
  Space complexity: O(1)
  """
  current = linkedList.nil_node.next_node
  while current != linkedList.nil_node
    runner = current.next_node
    while runner != current
      if runner.value = current.value
        linkedList.delete_node(runner)
    end
  end

end
