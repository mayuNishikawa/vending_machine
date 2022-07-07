require_relative "item.rb"
require_relative "cashier.rb"

class VendingMachine
  def self.start
    items = [
      { name: "水", price: 100 },
      { name: "コーラ", price: 120 },
      { name: "レッドブル", price: 200 }
    ]
    item = ["水", "コーラ", "レッドブル"]
    price = [100, 120, 200]

    item = Item.new(item, price)
    items = Item.create(items)
    cashier = Cashier.new

    # 商品選択
    puts "商品一覧"
    item.show(items)
    while true
      puts "お金を投入してください"
      slot_money = gets.to_i
      cashier.calculation(slot_money)
      puts "投入金額: ¥#{cashier.now} お金の投入を続けますか？【y】はい【n】いいえ"
      answer = gets.chomp
      if answer.include?("n")
        break
      elsif answer.include?("y")
        true
      end
    end
    puts "購入可能な商品はこちらです。番号を選択してください。お釣りを返す場合は【0】を選択してください"
    slotted_money = cashier.now
    show_can_buy = item.show_can_buy(items, slotted_money)
    number = gets.to_i #show_can_buyで表示されている数字と【0】で

    # 購入
    if number == 0
      cashier.repayment 
    else
      sold_item = items[(number - 1)]
      sold_item.minus_stock
      cashier.plus_sold_money(sold_item.price)
      puts "ｷﾞｬｺｫｫﾝ(ジュースが出る音)"
      puts "お釣りは¥#{(cashier.now) - (sold_item.price)}です。"
    end
  end
end



VendingMachine.start