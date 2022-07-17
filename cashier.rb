class Cashier
  attr_accessor :current_slot_money, :sales_money
  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @current_slot_money = 0
    @sales_money = 0
  end

  def now
    @current_slot_money
  end

  def repayment # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
    puts "¥#{@current_slot_money}返却します"
    @slot_money = 0
  end

  def calculation(slot_money)
    return false unless MONEY.include?(slot_money)
    @current_slot_money += slot_money
  end

  def counting(sold_item_price)
    @sales_money += sold_item_price
    @current_slot_money = 0
  end

  def purchasable?(number, num)
    (1..num) === number
  end

  def sales_money
    puts "売上金額: #{@sales_money}"
  end
end
