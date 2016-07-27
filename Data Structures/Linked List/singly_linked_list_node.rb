class SinglyLinkedListNode
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def find(value)
    return self if @value == value
    @next_node.nil? ? nil : @next_node.find(value)
  end
end
