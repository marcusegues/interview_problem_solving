class Graph
  attr_reader :adj
  def initialize
    @adj = {};
  end

  def add_edge(u, v)
    """
    Add an edge from node u to node v. Adds v to u's adjacency list.
    Time complexity: O(1)
    Space complexity: O(1)
    """
    @adj[u] = [] unless @adj[u]
    @adj[u] << v
  end
end
