require_relative './../Linked List/Queues/singly_linked_list_queue.rb'

class AnimalQueue
  """
  Problem 3.7 in Cracking the Code Interview
  An animal shelter holds only cats and dogs, and operates on a strictly first
  in first out basis. People must either adopt the oldest (based on arrival time)
  of all animals at the shelter, or they can select whether they want a dog or
  a cat (and will recieve the oldest animal of that type). They cannot select which
  specific animal they would like. Create the data structures to maintain this
  system and implement operations such as enqueue, dequeueAny, dequeueDog, and
  dequeueCat.
  """
  attr_accessor :dogQueue, :catQueue
  def initialize
    @order = 0
    @dogQueue = SinglyLinkedListQueue.new
    @catQueue = SinglyLinkedListQueue.new
  end

  def enqueue(animal)
    """
    Time complexity: O(1) because we are enqueueing using a Queue implemented
    using a singly linked list which enqueues in O(1)
    """
    animal.order = @order
    @order += 1
    if animal.class == Dog
      @dogQueue.enqueue(animal)
    else
      @catQueue.enqueue(animal)
    end
  end

  def dequeueDog
    """
    Time complexity: O(1)
    Space complexity: O(1)
    """
    @dogQueue.dequeue.value
  end

  def dequeueCat
    """
    Time complexity: O(1)
    Space complexity: O(1)
    """
    @catQueue.dequeue.value
  end

  def dequeueAny
    """
    Time complexity: O(1)
    Space complexity: O(1)
    """
    cat = @catQueue.peek.value
    dog = @dogQueue.peek.value
    if cat.nil?
      if dog.nil?
        return nil
      else
        dequeueDog
      end
    else
      if dog.nil?
        dequeueCat
      else
        cat.order < dog.order ? dequeueCat : dequeueDog
      end
    end
  end
end

class Animal
  attr_accessor :name, :order
  def initialize(name, order = nil)
    @order = order
    @name = name
  end
end

class Dog < Animal
  def initialize(name, order = nil)
    super
  end
end

class Cat < Animal
  def initialize(name, order = nil)
    super
  end
end
