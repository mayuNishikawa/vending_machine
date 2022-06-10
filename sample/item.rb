class Item
  def initialize #初期値
    @drink = "cola"
    @fee = 120
    @stock = 5
  end

  def number_of_stock #在庫管理
    @stock -= 1 if # drink is purchased の意味を表すインスタンスメソッドの実行
  end
end