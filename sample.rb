class DICStudent
  def initialize(name, address, age)
    @name = name
    @address = address
    @age = age
  end

  def name #①public…デフォルト。クラスの外部から制限なしに呼び出すことが出来る。
    @name
  end

  def introduce #①publicだけど、
    "私の名前は#{@name}です。" 
    older_than?(other_student)
  end

  private
  
  def where_live_in #②private…クラス内部及びそのサブクラスの内部からしか呼び出せない。レシーバーがselfのみに限定される。
    "#{@address}に住んでいます。"
  end

  protected

  def older_than?(other_student) #③protected…
    other_student.age < @age
  end
end
