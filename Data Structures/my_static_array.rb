class MyStaticArray
  """
  Simple static array that doesn't resize
  """
  def initialize(length = 0)
    @array = Array.new(length)
  end

  def [](idx)
    @array[idx]
  end

  def []=(idx, value)
    @array[idx] = value
  end
end
