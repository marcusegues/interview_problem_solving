require 'byebug'
load './Data Structures/Stacks and Queues/N Stacks in Array/my_stack.rb'

myStack = MyStack.new(5)

myStack.push(0, 10)
myStack.push(1, 20)
myStack.push(1, 21)
myStack.push(1, 22)
myStack.push(1, 23)
myStack.push(1, 24)
myStack.push(2, 30)
myStack.push(2, 31)
myStack.push(2, 32)
myStack.push(2, 33)
myStack.push(1, 25)
myStack.push(1, 26)

myStack.print_stack_array

myStack.pop(1)
myStack.pop(0)
myStack.pop(2)
puts "Now we pop"
myStack.print_stack_array
