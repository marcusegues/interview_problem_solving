class DFSResult
  def initialize
    @start = {}   # times when nodes first visited
    @finish = {}  # times when we're finished exploring nodes
    @parent = {}
    @edges = {}   # classification of special edges (back, forward, cross)
    @time = 0
    @order = []  # reverse of the topologically sorted nodes
  end
end
