require_relative "item.rb"
require_relative "slot_money.rb"

class VendingMachine
  attr_accessor :total_slotted, :sales_money, :stocks
  def initialize(items)
    @slot_money = SlotMoney.new
    @sales_money = 0
    @items = Item.create(items)
  end

  def start
    # 商品選択
    puts "商品一覧"
    @items.each_with_index do |item,i|
      if item.stock != 0
        puts "【#{i+1}】#{item.name} ¥#{item.price}"
      end
    end
    while true
      puts "お金を投入してください"
      money = gets.to_i
      @slot_money.calculation(money)
      puts "投入金額: ¥#{@slot_money.now} お金の投入を続けますか？【y】はい【n】いいえ"
      answer = gets.chomp
      if answer.include?("n")
        break
      elsif answer.include?("y")
        true
      end
    end
    puts "購入可能な商品はこちらです。番号を選択してください。お釣りを返す場合は【0】を選択してください"
    @items.each_with_index do |item,i|
      if item.stock != 0 && @slot_money.now >= item.price
        puts "【#{i+1}】#{item.name} ¥#{item.price}"
      end
    end
    number = gets.to_i

    # 購入
    if number == 0 
      @slot_money.repayment #ここの条件分岐がうまくいかない
    else
      sold_item = @items[(number - 1)]
      sold_item.minus_stock
      @sales_money += sold_item.price
      @slot_money.repayment
      puts "ｷﾞｬｺｫｫﾝ(ジュースが出る音)"
      puts "お釣りは¥#{(@slot_money.now) - (sold_item.price)}です。"
    end
  end
end


items = [
  { name: "water", price: 100 },
  { name: "cola", price: 120 },
  { name: "redbull", price: 200 }
]
vending_machine = VendingMachine.new(items)
vending_machine.start