# 双方向リスト
# double-linked list

require 'pp'

class DoubleList
  Node = Struct.new(:info, :next, :prev)

  def initialize
    @value = []
    @head  = 0
    @tail  = nil
  end

  def enqueue(x)
    p = @tail
    @tail = @head - 1 unless @tail
    @tail += 1
    @value[@tail] = Node.new(x, nil, p)
    @value[p].next = @tail unless @head == @tail
  end

  def dequeue
    return nil if @tail.nil? or @head > @tail
    x = @value[@head].info
    p = @value[@head].next
    @value[@head] = nil
    @value[p].prev = nil
    @head = p
    x
  end

  def revers
    return nil if @tail.nil? or @head > @tail
    p = @tail
    result = ""
    while p
      result << @value[p].info + " "
      p = @value[p].prev
    end
    result
  end

  def show
    return nil if @tail.nil? or @head > @tail
    p = @head
    result = ""
    while p
      result << @value[p].info + " "
      p = @value[p].next
    end
    result
  end

  def debug
    puts "-" * 40
    pp show
    pp ["value", @value]
    pp [" head", @head]
    pp [" tail", @tail]
  end
end

queue = DoubleList.new

p queue.dequeue
queue.debug

queue.enqueue("a")
0.upto 8 do |i|
  queue.debug
  queue.enqueue((98 + i).chr)
end
queue.debug

p queue.dequeue
queue.debug
p queue.revers
