# 推薦, 勧告

# 二者のアイテム間の距離による算出
def sim_distance(prefs, person1, person2)
  # 共通アイテムをくくりだす
  shared_items_a = shared_items_a(prefs, person1, person2)
  # 共通アイテムが無ければ0
  return 0 if shared_items_a.size == 0
  # 各アイテムの差の自乗の総和を計算する
  sum_of_squares = shared_items_a.inject(0){|result, item|result + (prefs[person1][item] - prefs[person2][item]) ** 2}
  return 1 / (1 + sum_of_squares)
end

# 二者のアイテムが同一直線に乗るかどうかで算出
def sim_pearson(prefs, person1, person2)
  # 共通アイテムをくくりだす
  shared_items_a = shared_items_a(prefs, person1, person2)
  # 共通アイテムが無ければ0
  n = shared_items_a.size
  return 0 if n == 0
  # 共通アイテムにあるすべての評価を加算
  sum1 = shared_items_a.inject(0){|result, si|result + prefs[person1][si]}
  sum2 = shared_items_a.inject(0){|result, si|result + prefs[person2][si]}
  # 共通アイテムにあるすべての評価の自乗を加算
  sum1_sq = shared_items_a.inject(0){|result, si|result + prefs[person1][si] ** 2}
  sum2_sq = shared_items_a.inject(0){|result, si|result + prefs[person2][si] ** 2}
  # productsの総計
  sum_products = shared_items_a.inject(0){|result, si|result + prefs[person1][si] * prefs[person2][si]}

  # ピアソン値を計算
  num = sum_products - (sum1 * sum2 / n)
  den = Math.sqrt((sum1_sq - sum1 ** 2 / n) * (sum2_sq - sum2 ** 2 / n))
  return 0 if den == 0
  return num / den
end

# 傾向の似ている順に評価者を取得
# 取得数，近似判定関数は指定可能とする
def top_matches(prefs, person, n = 5, similarity = :sim_pearson)
  scores = Array.new
  prefs.each do |key, value|
    # 自分じゃない評価者を計算
    scores << [__send__(similarity, prefs, person, key), key] unless key == person
  end
  scores.sort.reverse[0, n]
end

# ある評価者用のお勧めアイテムを計算する
def get_recommendations(prefs, person, similarity = :sim_pearson)
  totals_h = Hash.new(0)
  sim_sums_h = Hash.new(0)

  prefs.each do |other, val|
    next if other==person
    sim = __send__(similarity, prefs, person, other)
    next if sim <= 0
    prefs[other].each do |item, val|
      if !prefs[person].keys.include?(item) || prefs[person][item] == 0 then
        # 似てる度数*スコア
        totals_h[item] += prefs[other][item] * sim
        # 似てる度数の総和
        sim_sums_h[item] += sim
      end
    end
  end

  # 正規化したリストの作成
  rankings = Array.new
  totals_h.each do |item, total|
    rankings << [total / sim_sums_h[item], item]
  end
  rankings.sort.reverse
end

# {'name1'=>{item1=>score1, item2=>score2..}...} というハッシュを
# {'item1'=>{name1=>score1, name2=>score2..}...} というハッシュに変換する
def transform_prefs(prefs)
  result = Hash.new
  prefs.each do |person, score_h|
    score_h.each do |item, score|
      result[item] ||= Hash.new
      result[item][person] = score
    end
  end
  result
end

# 共通アイテムの取得
def shared_items(prefs, person1, person2)
  # 共通アイテムをくくりだす
  shared_items_h = Hash.new
  prefs[person1].each do |k, v|
    shared_items_h[k] = 1 if prefs[person2].include?(k)
  end
  shared_items_h
end

# 共通アイテムの取得その2
# shared_itemsと異なり，共通のキーの配列を返す
def shared_items_a(prefs, person1, person2)
  prefs[person1].keys & prefs[person2].keys
end

if $0 == __FILE__ then
  require 'pp'
  def critics
    {
      # name => {
      #   title => score
      # }
      :'Lisa Rose' => {
        :'Lady in the Water'  => 2.5,
        :'Snake on the Plane' => 3.5,
        :'Just My Luck'       => 3.0,
        :'Superman Returns'   => 3.5,
        :'You, Me and Dupree' => 2.5,
        :'The Night Listener' => 3.0
      },
      :'Gene Seymour' => {
        :'Lady in the Water'  => 3.0,
        :'Snake on the Plane' => 3.5,
        :'Just My Luck'       => 1.5,
        :'Superman Returns'   => 5.0,
        :'The Night Listener' => 3.0,
        :'You, Me and Dupree' => 3.5
      },
      :'Michael Phillips' => {
        :'Lady in the Water'  => 2.5,
        :'Snake on the Plane' => 3.0,
        :'Superman Returns'   => 3.5,
        :'The Night Listener' => 4.0
      },
      :'Claudia Puig' => {
        :'Snake on the Plane' => 3.5,
        :'Just My Luck'       => 3.0,
        :'The Night Listener' => 4.5,
        :'Superman Returns'   => 4.0,
        :'You, Me and Dupree' => 2.5
      },
      :'Mick LaSalle' => {
        :'Lady in the Water'  => 3.0,
        :'Snake on the Plane' => 4.0,
        :'Just My Luck'       => 2.0,
        :'Superman Returns'   => 3.0,
        :'The Night Listener' => 3.0,
        :'You, Me and Dupree' => 2.0
      },
      :'Jack Matthews' => {
        :'Lady in the Water'  => 3.0,
        :'Snake on the Plane' => 4.0,
        :'The Night Listener' => 3.0,
        :'Superman Returns'   => 5.0,
        :'You, Me and Dupree' => 3.5
      },
      :'Toby' => {
        :'Snake on the Plane' => 4.5,
        :'You, Me and Dupree' => 1.0,
        :'Superman Returns'   => 4.0
      },
    }
  end
  pp critics
  puts
  puts "二者のアイテム間の距離による算出: 'Lisa Rose', 'Gene Seymour'"
  pp sim_distance(critics, :'Lisa Rose', :'Gene Seymour')
  puts
  puts "二者のアイテムが同一直線に乗るかどうかで算出: 'Lisa Rose', 'Gene Seymour'"
  pp sim_pearson(critics, :'Lisa Rose', :'Gene Seymour')
  puts
  puts "傾向の似ている順に評価者を取得, 取得数，近似判定関数は指定可能とする: 'Toby'"
  pp top_matches(critics, :'Toby')
  puts
  puts "ある評価者用のお勧めアイテムを計算する: 'Toby'"
  pp get_recommendations(critics, :'Toby')

  # 下記の形に変換する
  #   title => {
  #    name => score
  #   }
  puts
  puts "================================================ movies"
  pp movies = transform_prefs(critics)
  puts
  puts "傾向の似ている順に評価者を取得, 取得数，近似判定関数は指定可能とする: 'Superman Returns'"
  pp top_matches(movies, :'Superman Returns')
end
