class GraphNode
  include Comparable
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def <=>(other)
    @value <=> other.value
  end
end
