class Human
  def initialize(name)
    @name = name
  end
  
  def eat
    puts "#{@name}は食べます"
  end

  def sleep
    puts "#{@name}は寝る"
  end

  def run
    puts "#{@name}は走る"
  end
end