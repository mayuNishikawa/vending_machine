require 'item'
require 'slot_money'
require 'purchase'

item = Item.new #①
slot_money = SlotMoney.new #②
purchase = Purchase.new #③
sales_money = SalesMoney.new #④

対話式
# 商品を定義する(①)

# 投入された金額は正しい硬貨かを自動販売機が判断する(②)
# →正しければ現在の総額に足す
# →間違えてればお金を返す
# 払い戻しがあれば返す

# ①在庫と②値段の整合性が取れているかを判断する(③)
# →買えるなら在庫減、売上げ増
# →買えなければ何もしない

# 売上金を管理する(④)
# 釣り銭を返す
# 売上金に追加する

