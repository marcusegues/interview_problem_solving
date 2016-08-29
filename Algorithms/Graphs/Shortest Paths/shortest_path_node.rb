require_relative './graph_node.rb'

class ShortestPathNode < GraphNode
  attr_accessor :d, :parent

  def initialize(value)
    super
    @d = Float::Infinity
    @parent = nil
  end

  def <=>(other)
    @d <=> other.d
  end
end
