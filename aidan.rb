basically

we want a stack that also keeps track of the max/min element in it (keep track of current min, current max, push those as well, and then update if needed based on the new element; when its popped you can restore the old current_min and current_max by popping them back off)

we can make a queue out of two of these stacks
(have an input stack to enqueue and an output stack to dequeue; if you dequeue and the output stack is empty, pop the input stack until its empty pushing each of these elements into the output stack, effectively inverting their order)

and then you can check the size of said queue to enforce the window size (queue.dequeue if queue.size > window_size), and keep track of the max range seen so far (queue.max - queue.min)
its an extremely difficult problem

class StackQueue
    def initialize
        @stack1 = MyStack.new 
        @stack2 = MyStack.new 
        @size = nil
        @store = []
    end

    def enqueue(ele)
        @stack1.push(ele)

    def dequeue
        if @stack2.empty?
            until @stack1.empty?
              @stack2.push(@stack1.pop) 
            end
          @stack2.pop
        end
    end
end

queue
123456
enqueue(7)
1234567
dequeue => 1
234567
enqueue(8)
2345678
dequeue => 2
345678



--------------

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

queue
123456
1234567
234567
2345678
345678

stack
123456
1234567
123456
1234567
123456

[2]
[5] pry(main)> s.enqueue(4)
=> [2, 4]
[6] pry(main)> s.enqueue(9)
=> [2, 4, 9]
[7] pry(main)> s.enqueue(37)
=> [2, 4, 9, 37]
[8] pry(main)> s.dequeue()
=> [37]
dequeue => 2
s = [4, 9, 37]

queue
123456
enqueue(7)
1234567
dequeue => 1
234567
enqueue(8)
2345678
dequeue => 2
345678

234567
2345678
345678


