require_relative './graph_node.rb'
require 'byebug'
class ShortestPathNode < GraphNode
  attr_accessor :d, :parent, :queue_position

  def initialize(value)
    super
    @d = nil
    @parent = nil
    @queue_position = nil  # position in priority queue in Dijkstra
  end

  def key
    @d
  end

  def key=(value)
    @d = value
  end

  def <=>(other)
    @d <=> other.d
  rescue
    @d <=> other
  end
end
