class Graph
  attr_reader :adj
  def initialize(undirected = false)
    @adj = {};
    @undirected = undirected
    @weight = {}
  end

  def vertices
    @adj.keys
  end

  def add_edge(u, v, weight = nil)
    """
    Add an edge from node u to node v. Adds v to u's adjacency list.
    Time complexity: O(1)
    Space complexity: O(1)
    """
    @adj[u] = [] unless @adj[u]
    @adj[u] << v
    add_weight(u, v, weight) if weight
    if @undirected
      @adj[v] = [] unless @adj[v]
      @adj[v] << u
    end
  end

  def add_weight(u, v, w)
    @weight[[u,v]] = w
  end

  def weight(u, v)
    @weight[[u,v]] || @weight[[v,u]]
  end
end
