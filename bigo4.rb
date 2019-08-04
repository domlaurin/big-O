require 'byebug'

def windowed_max_range(array, window_size)
  current_max_range = nil
  array.each_with_index do |ele, i|
    if array[i + window_size - 1] != nil
      max_range = array[i..i + window_size - 1].max - array[i..i + window_size - 1].min
      current_max_range = max_range if current_max_range == nil
      current_max_range = max_range if max_range > current_max_range
    end
  end
  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) ##== 6 # 3, 2, 5, 4, 8

O(n^2)


phase 2 

class MyQueue
    def initialize
        @store = []
    end

    def peek
        @store.first
    end

    def size 
        @store.size
    end

    def empty?
        @store.empty?
    end

    def enqueue(rabbit)
        @store << rabbit
    end

    def dequeue
        @store.shift
    end
end



phase 3

class MyStack
    def initialize
        @store = []
    end

    def peek
        @store.first
    end

    def size 
        @store.size
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push(rabbit)
        @store << rabbit
    end
end


phase 4

class StackQueue
    def initialize
        @store = MyStack.new
        @store2 = MyStack.new
    end

    def size 
        @store.size
    end

    def empty?
        @store.empty?
    end

    def enqueue(rabbit)
        @store.push(rabbit)
    end

    def dequeue
      if @store2.empty? 
        @store2.push(@store.pop)
      end
    end
end

we will still have a queue but with the advantages of dequeuing in O(1) time.