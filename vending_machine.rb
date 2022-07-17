require_relative "item.rb"
require_relative "cashier.rb"

class VendingMachine
  def self.start
    stock = Stock.new
    cashier = Cashier.new
    continue = true

    while continue
      puts "【1】お客さんです【2】自動販売機業者です"
      who = gets.chomp
      
      puts "値が正しくないので処理できませんでした" and break unless who.include?("1") || who.include?("2")
      if who.include?("1")
      # 商品選択
        puts "商品一覧"
        stock.show
        while true
          puts "お金を投入してください"
          slot_money = gets.to_i
          cashier.calculation(slot_money)
          puts "投入金額: ¥#{cashier.now} お金の投入を続けますか？【y】はい【n】いいえ"
          answer = gets.chomp
          break if answer.include?("n")
        end
        while true
          puts "購入可能な商品はこちらです。番号を選択してください。お釣りを返す場合は【999】を選択してください"
          num = stock.show_can_buy(slotted_money: cashier.now, num: 0)
          number = gets.to_i   
      # 購入     
          cashier.repayment and break if number == 999
          if cashier.purchasable?(number, num)
            sold_item = stock.item_list[(number - 1)]
            stock.minus(sold_item)
            puts "ｷﾞｬｺｫｫﾝ"
            puts "お釣りは¥#{cashier.now - sold_item.price}です。"
            cashier.counting(sold_item.price)
            break
          end
        end
      elsif who.include?("2")
        while true
          puts "【1】売上金の確認 【2】在庫の確認"
          job = gets.chomp
          cashier.sales_money and break if job.include?("1")
          stock.check and break if job.include?("2")
        end
      end

      puts "自動販売機にまだ用事がありますか？【y】はい【n】いいえ"
      answer = gets.chomp
      continue = false if answer.include?("n")
    end
  end
end