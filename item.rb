class Item
  attr_reader :name, :price
  attr_accessor :stock

  def initialize(name:, price:)
    @name = name
    @price = price
    @stock = 5
  end
end

class Stock
  attr_accessor :item_list

  def initialize
    @item_list = [
      Item.new(name: "water", price: 100),
      Item.new(name: "cola", price: 120),
      Item.new(name: "redbull", price: 200)
    ]
  end

  def check
    @item_list.each_with_index do |item,i|
      puts "【#{i+1}】商品: #{item.name} / 値段: ¥#{item.price} / 在庫: #{item.stock}"
    end
  end

  def show
    @item_list.each_with_index do |item,i|
      if item.stock != 0
        puts "【#{i+1}】商品: #{item.name} / 値段: ¥#{item.price} "
      end
    end
  end

  def show_can_buy(slotted_money:, num:)
    @item_list.each_with_index do |item,i|
      if item.stock != 0 && slotted_money >= item.price
        puts  "【#{i+1}】商品: #{item.name} / 値段: ¥#{item.price} "
        num += 1
      end
    end
    return num
  end

  def minus(sold_item)
    sold_item.stock -= 1
  end
end