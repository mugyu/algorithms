# バックトラック法
# バックトラック例題「2枚のカードの間には？」
# ここでは例題として「2枚のカードの間には？」(Ｃマガ電脳クラブ91年4月号より)
# に挑戦してみます。1から7の数字を書いたカードが2枚ずつ計14枚ある。そしてこ
# れを1列に並べ，2枚の1の間にはカードが1枚，2枚の2の間にはカードが2枚はさま
# れていて,同様に，3の間には3枚,4の間には4枚,5の間には5枚,6の間には6枚,7の間
# には7枚のカードがはさまれるように14枚のカードを並べて下さい。

require 'pp'

def backtrack(cards, p)
  if p > 7
    p cards
  else
    i = 0
    j = p + 1
    while j < 14
      if cards[i].zero? and cards[j].zero? # カードが置けるなら
        cards[i] = p                       # カードを置く(仮定)
        cards[j] = p
        backtrack(cards, p + 1)            # 再帰で次のNo.カードへ
        cards[i] = 0                       # 状態を元に戻す
        cards[j] = 0
      end
      i += 1
      j += 1
    end
  end
end

backtrack(Array.new(14, 0), 1)
