class Item
  attr_accessor :name, :price, :stock

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

  def minus_stock
    @stock -= 1
  end
end

