class MyStack

    attr_reader :store
    def initialize
        @store = []
    end
    def reverse!
        @store.reverse!
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

class StackQueue
    def initialize
        @stack1 = MyStack.new 
        @stack2 = MyStack.new 
        @size = nil
        @store = []
    end

    def size(window_size)
        @size = window_size
    end

    def enqueue(ele)
        if @stack1.empty? && @stack2.empty?
            @stack1.push(ele)
        end
        if @stack1.empty?
            @stack2.push(ele)
        end
        if @stack2.empty?
            @stack1.push(ele)
        end
    end
    
    def dequeue
        if @stack2.empty?
            @size.times do 
                @stack2.push(@stack1.pop)
            end
            @stack2.reverse!
            @stack1 = MyStack.new

            @store = @stack2.store
        end 
        if @stack1.empty?
            @size.times do 
                @stack1.push(@stack2.pop)
            end
            @stack1.reverse!
            @stack2 = MyStack.new

            @store = @stack1.store
        end 
    end
end

#Testing the code

a = [1,2,3,4,5,6]

window_size = 3

sq = StackQueue.new

sq.size(3)

a.each_with_index do |ele, i|
    if i == window_size - 1
        sq.enqueue(ele)
        next
    end
    if i < window_size
        sq.enqueue(ele)
        next
    end
    sq.enqueue(ele)
    print sq.dequeue
end

#this returns 
#[2, 3, 4]
#[3, 4, 5]
#[4, 5, 6]
# which is what we need.

