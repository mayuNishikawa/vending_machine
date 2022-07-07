class SlotMoney
  attr_accessor :current_slot_money
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @current_slot_money = 0
  end

  def now
    @current_slot_money
  end

  def repayment # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
    puts "¥#{@current_slot_money}返却します"
    @slot_money = 0
  end

  def calculation(money)
    return false unless MONEY.include?(money)
    @current_slot_money += money
  end
end
