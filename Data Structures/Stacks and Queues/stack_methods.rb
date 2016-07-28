module StackMethods
  def sortStack
    """
    Sort stack from largest at top to smallest at bottom of stack.
    Worst case occurs when the original stack is already sorted as desired.
    a) Pop from thisStack save to variable current.
    b) Pop all elements from auxStack and push onto thisStack
    c) Push current to auxStack
    d) Push all previously popped elements from auxStack back onto thisStack.
    Time complexity:  O(n^2), because steps b) and d) involve a number n of
    operations that increases by one for each element in thisStack. Summing
    the total number of operations in the worst case is 0 + 1 + 2 + ... + (n - 1)
    Space complexity: O(n), we use an auxiliary stack (that is returned in the
    end and also a clone of the original stack)
    """
    thisStack = self.clone
    auxStack = self.class.new

    until thisStack.empty?
      current = thisStack.pop
      while true
        auxTop = auxStack.peek
        break if auxTop.nil? || auxTop <= current
        thisStack.push(auxStack.pop)
      end
      auxStack.push(current)
    end
    auxStack
  end
end
