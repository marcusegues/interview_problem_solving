def remove_duplicates(linkedList)
  """
  remove duplicates from a linked list object
  Time complexity: O(n)
  Space complexity: O(n)
  """
  seen = {}
  current = linkedList.head
  while !current.nil?
    if seen[current.value]
      linkedList.delete_node(current)
    else
      seen[current.value] = true
    end
    current = current.next_node
  end
end
