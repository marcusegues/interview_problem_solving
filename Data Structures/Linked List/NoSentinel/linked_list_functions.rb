def delete_node(node)
  """
  Delete a node without access to head node
  Time complexity: O(1)
  Space complexity: O(1)
  Note: this doesn't work if the node to be deleted is the last node in
  the linked list
  """
  return false if node.next_node.nil?
  node.value = node.next_node.value
  node.next_node = node.next_node.next_node
  true
end
