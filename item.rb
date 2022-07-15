class Item
  attr_reader :name, :price
  attr_accessor :stock

  def initialize(name, price)
    @name = name
    @price = price
    @stock = 5
  end

  def self.create(items)
    items.map do |item|
      Item.new(item[:name], item[:price])
    end
  end

  def show(items)
    items.each_with_index do |item,i|
      if item.stock != 0
        puts "【#{i+1}】#{item.name} ¥#{item.price}"
      end
    end
  end

  def show_can_buy(items, slotted_money, num)
    items.each_with_index do |item,i|
      if item.stock != 0 && slotted_money >= item.price
        puts "【#{i+1}】#{item.name} ¥#{item.price}"
        num += 1
      end
    end
    return num
  end

  def minus_stock
    @stock -= 1
  end
end
