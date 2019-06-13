# リスト構造
#   スタック
#   Last In First Out
#   Singly-linked list

require 'pp'

class Stack
  def initialize
    @value = []
    @next  = []
    @head  = nil
    @last  = 0
  end

  def push(x)
    q = @last
    @last += 1
    @value[q] = x
    @next[q]  = @head
    @head = q
  end

  def pop
    x = @value[@head]
    p =@head
    q = p
    p = @next[p]
    @next[q] = nil
    @head = p
    x
  end

  def reverse
    p = @head
    q = nil
    while p
      t = q
      q = p
      p = @next[p]
      @next[q] = t
    end
    @head = q
  end

  def show
    p = @head
    result = ""
    while p
      result << @value[p] + " "
      p = @next[p]
    end
    result
  end

  def debug
    p show
    p ["value", @value]
    p [" next", @next]
    p [" head", @head]
    p [" last", @last]
  end
end


stack = Stack.new

0.upto 9 do |i|
  stack.push((97 + i).chr)
end
stack.debug

stack.reverse
stack.debug

0.upto 4 do |i|
  stack.push((107 + i).chr)
end
stack.debug

stack.pop
stack.debug

stack.pop
stack.debug

stack.push("z")
stack.debug
