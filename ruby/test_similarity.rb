require './similarity'
require 'test/unit'

TEXT11 = "ライブドアでブログを書く"
TEXT12 = "ブログをライブドアで書く"

TEXT2 =<<EOS
当初、はてなキーワードやWikipediaを足して2で割ったようなサービスを作れといっ
た開き直った指示のもとで開発が開始されたともいう、分社化前の芸風の名残で、
キーワードの検索結果にはユーザが自由に解説を書き込める Wikipedia 的スペース
もついています。
EOS

TEXT31 =<<EOS
「梅雨」
北海道と小笠原諸島を除く日本において見られる特有の気象で、5月から7月半ばにか
けて毎年めぐってくる、雨の多い期間のこと。梅雨に入ることを梅雨入り、梅雨が終
わって夏になることを梅雨明けと言い、日本各地の地方気象台・気象庁が梅雨入り・
梅雨明けの発表をする。
EOS

TEXT32 =<<EOS
梅雨（ばいう、つゆ）とは、北海道と小笠原諸島を除く日本や朝鮮半島南部、華南や
華中の沿海部や台湾において見られる特有の気象で、5月から7月半ばにかけて毎年め
ぐってくる、雨の多い期間のこと。梅雨の時季が始まることを梅雨入り、梅雨が終
わって夏になることを梅雨明けと言い、日本では、各地の地方気象台・気象庁が梅雨
入り・梅雨明けの発表をする。
EOS

class TestTrigram < Test::Unit::TestCase
  def test_trigram
    assert_equal(0.0, TEXT2.similarity(TEXT11))
    assert_equal(0.0, TEXT11.similarity(TEXT2))
    assert_equal(0.6, TEXT11.similarity(TEXT12))
    assert_equal(0.6, TEXT12.similarity(TEXT11))
    assert_equal(1.0, TEXT11.similarity(TEXT11))
    assert_equal(1.0, TEXT12.similarity(TEXT12))
    assert_equal(1.0, TEXT2.similarity(TEXT2))
    assert_equal("0.7945205479452054", TEXT31.similarity(TEXT32).to_s)
    assert_equal("0.7945205479452054", TEXT32.similarity(TEXT31).to_s)
    assert_equal("0.006872852233676976", TEXT2.similarity(TEXT32).to_s)
    assert_equal("0.006872852233676976", TEXT32.similarity(TEXT2).to_s)
  end
end
