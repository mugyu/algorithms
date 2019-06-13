# リスト構造
#   キュー
#   First In First Out
#   Singly-linked list

require 'pp'

class Queue
  def initialize
    @value = []
    @next  = []
    @head  = 0
    @tail  = -1
  end

  def enqueue(x)
    p = @tail
    @tail += 1
    @value[@tail] = x
    @next[@tail] = nil
    @next[p] = @tail unless @head == @tail
  end

  def dequeue
    return nil if @head > @tail
    x = @value[@head]
    p = @next[@head]
    @value[@head] = nil
    @next[@head] = nil
    @head = p
    x
  end

  def show
    return nil if @head > @tail
    p = @head
    result = ""
    while p
      result << @value[p] + " "
      p = @next[p]
    end
    result
  end

  def debug
    puts "-" * 40
    p show
    p ["value", @value]
    p [" next", @next]
    p [" head", @head]
    p [" tail", @tail]
  end
end


queue = Queue.new

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
