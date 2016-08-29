module TreeMethods

  def is_balanced?
    """
    Time complexity: O(n)
    Space complexity: O(h), because though we end up making n recursive calls (we
    visit every node through recursion), the call stack has at most h stack frames
    because this is the deepest we can get into the tree before we reach a leaf, which
    returns a value.
    """
    !height(root).nil?
  end

  def height(node)
    return -1 if node.nil?
    left_height = height(node.left)
    right_height = height(node.right)
    return nil if left_height.nil? || right_height.nil?
    (left_height - right_height).abs > 1 ? nil : [left_height, right_height].max + 1
  end

end
