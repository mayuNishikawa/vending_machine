💰投入金額　を管理する🦜

💰お金を表示する🦜

💰売上金　を管理する

💰お釣り　を管理する


🥤飲み物　(定義)
属性：飲み物、飲み物の価格、飲み物の在庫
・

🥤飲み物の在庫　(管理する)
・購入されたら-1

🥤買える飲み物　(表示する)
属性：　飲み物、飲み物の価格、飲み物の在庫、投入されるお金
・投入金額に応じて表示する
・ストックのあるものを表示する…飲み物の在庫メソッドから引用?


ユーザー
・選択する
・お金を入れる


クラス分けで意識すべき点

(以下リーダー会から得たヒント)
・機能の拡張性を考えて関係性。例えば、「新しい飲み物の追加」「温かい飲み物の追加」「キャッシュレス決済」「新硬貨追加」等追加しやすいクラス分け
・クラス名とメソッド名を組み合わせて何をしているか分かる命名。例えば、梅田駅の改札に入るなら「umeda.enter」等


# 部品化(クラス設計)のヒント
# ・現実世界の観察（どんなものがあるか）
# 　→名詞は部品になりうる
# ・クラス同士の関係性(1:1, 1:多, 多:多)見る
# ・クラスがしていること＝操作(メソッドになりうる)

class Drink
  attr_reader :name, :price, :stock #①def name を書く代わりにこれ書けばok
  attr_writer :name, :price, :stock #②def name=(value) を書く代わりにこれ書けばok
  attr_accessor :name, :price, :stock #上記2つ

  def initialize(name, price)
    @name = name
    @price = price
    @stock = 5
  end

  def name #①
    @name = name
  end

  def name=(value) #②
    @name = value
  end
end

drink = Drink.new("cola", 120)
drink.name          => cola #①の結果(定義してなかったら、NoMethodErrorが帰ってくる)
drink.name = water  => water #②の結果(定義してなかったら、NoMethodErrorが帰ってくる)