HASHSIZE   = 1001
MAXWORDLEN = 128
CHAR_BIT   = 8
Struct::Node = Struct.new(:left, :right, :key, :value)

def hash(str)
  v = 0
  str.each_byte do |c|
    v = ((v << CHAR_BIT) + c).modulo(HASHSIZE)
  end
  v
end

def insert(word)
  new_node = Struct::Node.new(nil, nil, word, 1)
  node = @hashtable[hash(word)]
  @hashtable[hash(word)] = node_insert(node, new_node)
end

def node_insert(node, new_node)
  if node
    cmp = node.key <=> new_node.key
    if cmp == 0
      node.value = node.value + 1
      node
    elsif cmp > 0
      if node.left
        node = node_insert(node.left, new_node)
      else
        node.left = new_node
      end
      node
    else
      if node.right
        node = node_insert(node.right, new_node)
      else
        node.right = new_node
      end
      node
    end
  else
    new_node
  end
end

def find(word)
  node = @hashtable[hash(word)]
  if node
    node_find(node, word)
  else
    false
  end
end

def node_find(node, word)
  cmp = node.key <=> word
  if cmp == 0
    true
  elsif cmp > 0
    if node.left
      node_find(node.left, word)
    else
      false
    end
  else
    if node.right
      node_find(node.right, word)
    else
      false
    end
  end
end

require 'pp'

@hashtable = Array.new
DATA.read.split(/\s+/m).each do |word|
  insert(word)
end
@hashtable.each_with_index do |val, i|
  pp [i, val] if val
end
puts "-" * 40
p ["aaa", find("aaa")]
p ["bbb", find("bbb")]
p ["ccc", find("ccc")]
p ["ddd", find("ddd")]
p ["nnn", find("nnn")]

__END__
aaa bbb ccc aaa ccc aaa nnn
