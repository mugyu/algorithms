# 二分検索木 bunary search tree

require 'pp'

class BinarySearchTree

  Nil  = Struct.new(:key, :left, :right)
  Node = Struct.new(:key, :left, :right)

  def initialize
    @nil = Nil.new(:nil, nil, :nil)
    @value = [@nil]            # 実態格納配列
    @v_last = @value.size - 1
    @ptr   = [0, 0]            # ポインタ格納配列
    @p_last = @ptr.size - 1
    @root = 1
  end

  def insert(key)
    puts "insert(#{key})"
    @nil.key = key                               # ここいら辺は要するに検索
    p = @root
    while @value[@ptr[p]].key != key
      if @value[@ptr[p]].key > key
        p = @value[@ptr[p]].left
      elsif @value[@ptr[p]].key < key
        p = @value[@ptr[p]].right
      end
    end
    if @value[@ptr[p]] != @nil
      puts "found!"
      return nil
    end

    # insert
    @ptr[@p_last += 1] = 0
    t = @p_last
    @ptr[@p_last += 1] = 0
    @value[@v_last += 1] = Node.new(key, t, @p_last)
    @ptr[p] = @v_last
  end

  def delete(key)
    puts "delete(#{key})"
    @nil.key = key                               # ここいら辺は要するに検索
    p = @root
    while @value[@ptr[p]].key != key
      if @value[@ptr[p]].key > key
        p = @value[@ptr[p]].left
      elsif @value[@ptr[p]].key < key
        p = @value[@ptr[p]].right
      end
    end
    if @value[@ptr[p]] == @nil
      puts "not found!"
      return nil
    end

    # delete
    r = @ptr[p]
    if @value[@ptr[@value[r].right]] == @nil
      @ptr[p] = @ptr[@value[r].left]
    elsif @value[@ptr[@value[r].left]] == @nil
      @ptr[p] = @ptr[@value[r].right]
    else
      q = @value[r].left                                #
      while @value[@ptr[@value[@ptr[q]].right]] != @nil # - qのnodeは削除key未満で
        q = @value[@ptr[q]].right                       #   最大のkey値を持つnode
      end                                               #

      s = @ptr[q]

      @ptr[q] = @ptr[@value[s].left]          # - 削除key未満で最大のkeyを持つnodeが下記の
                                              #   昇格して空く順位に昇格したnodeの左の子が昇格

      @value[s].left  = @value[@ptr[r]].left  # - 削除key未満で最大のkeyを持つnodeが
      @value[s].right = @value[@ptr[r]].right #   削除keyを持つnodeの順位に昇格
      @ptr[p] = s                             #

    end
    @value[r] = @nil
  end

  def search
    puts "search(#{key})"
    @nil.key = key
    p = @root
    while @value[@ptr[p]].key != key
      if @value[@ptr[p]].key > key
        p = @value[@ptr[p]].left
      elsif @value[@ptr[p]].key < key
        p = @value[@ptr[p]].right
      end
    end
    if @value[@ptr[p]] == @nil
      return nil
    else
      return p
    end
  end

  def print
    puts "-" * 40
    @depth = 0
    print_tree(@root)
    puts ""
  end

  private

  # トラバースして全nodeのkeyを出力
  def print_tree(p)
    if @value[@ptr[@value[@ptr[p]].left]] != @nil
      @depth += 1
      print_tree(@value[@ptr[p]].left)
      @depth -= 1
    end
    puts "#{' ' * (5 * @depth)}#{@value[@ptr[p]].key}"
    if @value[@ptr[@value[@ptr[p]].right]] != @nil
      @depth += 1
      print_tree(@value[@ptr[p]].right)
      @depth -= 1
    end
  end
end

tree = BinarySearchTree.new
tree.insert("555")
tree.insert("333")
tree.insert("777")
tree.insert("999")
tree.insert("444")
tree.insert("888")
tree.insert("222")
tree.insert("111")
tree.insert("666")
tree.print
tree.delete("999")
tree.print
tree.delete("444")
tree.print
tree.insert("444")
tree.print
tree.insert("401")
tree.print
tree.insert("400")
tree.print
tree.insert("402")
tree.print
tree.delete("555")
tree.print
#pp tree
