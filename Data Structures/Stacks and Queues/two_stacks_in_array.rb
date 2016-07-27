class TwoStacksOneArray
  def initialize(length = 10)
    @top1 = -1
    @top2 = length
    @array = Array.new(length)
  end

  def empty1?
    @top1 == -1
  end

  def empty2?
    @top2 == length
  end

  def full?
    @top2 == @top1 + 1
  end

  def push1(value)
    raise "Stack overflow" if full?
    @top1 += 1
    @array[@top1] = value
  end

  def push2(value)
    raise "Stack overflow" if full?
    @top2 -= 1
    @array[@top2] = value
  end

  def pop1
    raise "Stack underflow" if empty1?
    @top1 -= 1
    @array[@top1 + 1]
  end

  def pop2
    raise "Stack underflow" if empty2?
    @top2 += 1
    @array[@top2 - 1]
  end

end
