class BSTNode
  """
  Node in a BST.
  """
  def initialize(key)
    """
    Creates a BST node.
    Should be inserted into a tree by calling BST.insert()
    """
    @key = key
    @parent = nil
    @left = nil
    @right = nil
  end

  def find(key)
    """
    Iterative version.
    Searches for node with given key in the subtree rooted at self.
    Returns a BSTNode instance with the given key, or nil if the key was not found.
    Time complexity: O(h)
    Space complexity: O(1)
    """
    current = self
    while !current.nil?
      return self if @key == key
      current = key < @key ? current.left : current.right
    end
    nil
  end

  def find_rec(key)
    """
    Recursive version.
    Searches for node with given key in the subtree rooted at self.
    Returns a BSTNode instance with the given key, or nil if the key was not found.
    Time complexity: O(h)
    Space complexity: O(h)
    """
    if key < @key
      return @left && @left.find_rec(key)
    elsif key > @key
      return @right && @right.find_rec(key)
    end
    self
  end

  def min
    """
    Iterative version
    Returns a BSTNode instance with the minimum key in the subtree rooted at this node.
    Time complexity: O(h)
    Space complexity: O(1)
    """
    current = self
    while !current.left.nil?
      current = current.left
    end
    current
  end

  def min_rec
    """
    Iterative version
    Returns a BSTNode instance with the minimum key in the subtree rooted at this node.
    Time complexity: O(h)
    Space complexity: O(h)
    """
    return self if self.left.nil?
    self.left.min
  end

end


  def successor(self):
    """The node with the next larger key (the successor) in the BST.

    Returns a BSTNode instance, or None if this node has no successor.
    """
    if self.right is not None:
      return self.right.min()
    current = self
    while current.parent is not None and current is current.parent.right:
      current = current.parent
    return current.parent

  def insert(self, node):
    """Inserts a node into the subtree rooted at this node.

    Args:
      node: the node to be inserted

    Returns the node argument, if the node was inserted in the tree. If a node
    with the same key was found, that node is returned instead.
    """
    if node.key < self.key:
      if self.left is not None:
        return self.left.insert(node)
      node.parent = self
      self.left = node
      return node
    elif node.key > self.key:
      if self.right is not None:
        return self.right.insert(node)
      node.parent = self
      self.right = node
      return node
    return self

  def delete(self):
    """Deletes this node from the BST.

    Returns the deleted BSTNode instance. The instance might be different from
    this node, but will have this node's key. The deleted node's fields will
    still be set, despite the fact that it does not belong to the tree anymore.
    """
    if self.left is None or self.right is None:
      if self is self.parent.left:
        self.parent.left = self.left or self.right
        if self.parent.left is not None:
          self.parent.left.parent = self.parent
      else:
        self.parent.right = self.left or self.right
        if self.parent.right is not None:
          self.parent.right.parent = self.parent
      return self
    else:
      s = self.successor()
      deleted_node = s.delete()
      self.key, s.key = s.key, self.key
      return deleted_node
