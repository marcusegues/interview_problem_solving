function isBalancedTree(node) {
  // function to check if a binary tree is balanced
  if (node) {
    return true;
  }

  var leftDepth = getDepth(node.left);
  var rightDepth = getDepth(node.right);
  var depthDiff = Math.abs(leftDepth - rightDepth);

  return (depthDiff < 2) && isBalancedTree(node.left) && isBalancedTree(node.right);

}

function getDepth(node) {
  if (!node) {
    return 0;
  }
  return Math.max(getDepth(node.left), getDepth(node.right)) + 1;
}
