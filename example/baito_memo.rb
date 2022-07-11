class MakingTaiyaki #新人バイト門脇くんが書いた「たいやきを作る方法」のメモ。
  #このたいやき屋は味が3種類ありますが、作り方は中に入れる味以外同じ動作で作れます。大繁盛しているので、味ごとにメモを取る時間はありません。
  def initialize(orderd_taste) 
    @orderd_taste =  orderd_taste #注文が入ったら@tasteに代入。これでたいやきを作る方法のメモの中ならばどこでも注文の味を呼び出せます。
  end

  def kiji
    puts "生地を流し込むよ"
  end

  def tasting
    puts "生地の中に#{@orderd_taste}をいれるよ" #@orderd_tasteの中身は引数orderd_tasteの内容です。
  end

  def baking
    puts "あとは焼くだけ"
  end

  #店長の気まぐれで、焼けたたい焼きの上にトッピングする工程が増えました。やれやれ。
  def topping
    puts "たい焼きの上に#{@orderd_taste}をのせるよ" #工程が追加されても、最初に定義した@tasteを使えるから1行書くだけ！
  end
  #もし「あんこ味の作り方」「クリーム味の作り方」…という風にメモを取ってたら5つの味全てにトッピング工程のメモを追加する羽目になってたなあ。
  #期間限定の味が増えてもこのメモ1つあれば対応出来るから安心だ！
end


#接客もさせてもらえるようになったよ。
#たい焼きを焼くだけがたいやきバイトの仕事じゃあないんだ。

class Taiyaki #たい焼きの情報を作るためのクラス
  def initialize(taste, fee)
    @taste = taste
    @fee = fee
  end

  def taste
    @taste
  end

  def fee
    @fee
  end
end

taiyaki = Taiyaki.new("anko",100)
taiyaki.taste => anko
taiyaki.fee => 100

taiyakis << taiyaki

class CustomerService #接客について
  def initialize(taiyakis) #③メニュー表配列のデータが渡されます
    @taiyakis = taiyakis
  end

  def taiyakis
    @taiyakis
  end

  def show_taiyakis
    i = 0
    taiyakis.each do |taiyaki|
      puts "【#{i}】#{taiyaki.taste}: #{taiyaki.fee}円" #配列の中身はTaiyakiクラスで作られたインスタンスの集まりだから、Taiyakiクラスのメソッドを使える。
      i += 1
    end
  end

  def take_order
    puts "「ご注文をお伺いします。番号でお答えください！」"
  end

  def cash(orderd_fee,pay)
    while true
      change = pay - orderd_fee #お釣り ＝ 支払い額 - 注文されたたい焼きの料金
      if change >= 0
        puts "「お釣りは#{change}円です。ありがとうございます！またお越しくださいませ！」"
        break #whileで無限ループを作っているのでループを抜けるためbreak。これがなかったら「ありがとうございました！∞」という怖い店員になります
      else
        puts "「金額が足りません。料金を追加してください」" #お前みたいなちゃんと払わん客のせいで無限ループつくっとるんじゃ〜
        additional_pay = gets.to_i #追加料金を数値として取得
        added_pay = pay + additional_pay #追加後の合計料金 = 追加前の料金 + 追加料金
        pay = added_pay #pay変数を定義して追加後の合計料金を代入。ループの戦闘のお釣り計算に使うためです。
      end
    end
  end
end

#今日の仕込みです。
puts "仕込みをします。商品を3つ用意してください。"
taiyaki_tastes = [] #①味の情報だけを入れる配列を定義
taiyaki_fees = [] #②料金の情報だけを入れる配列を定義
taiyakis = [] #③これはメニュー表にあたる配列
3.times do |i| #商品情報を決めます。
  puts "商品名を入力してください。"
  taiyaki_taste = gets.chomp #やっぱ王道はあんこですよね〜
  taiyaki_tastes << taiyaki_taste #味は味で①配列に
  puts "金額を入力してください。"
  taiyaki_fee = gets.to_i #小麦粉が値上がりしてるから価格決定もシビアです
  taiyaki_fees << taiyaki_fee #料金は料金で②配列に
  taiyakis << Taiyaki.new(taiyaki_taste,taiyaki_fee) #Taiyaki.newインスタンス(@taste=今決めた味,@fee=今決めた料金は)を③配列テータに保存。@taste,@feeはインスタンスの情報として1まとまりの配列データ内に格納される。irbで試すとわかりやすい。
end #3つ商品情報を決めるまでこのループは終わらない

#お客さんが来ました。
puts "「いらっしゃいませ。」"
customer_service = CustomerService.new(taiyakis) #さっき仕込みをしたたいやきの情報③を、接客メモの引数に。
customer_service.show_taiyakis #メニューを見せてあげましょう
customer_service.take_order #注文をとります
order = gets.to_i #番号で答えてもらったので、①味配列②料金配列③メニュー配列のどこからでも注文情報を取り出せます


#たいやきを作る。初日からつくり続けてきたからおてのもんやな。
orderd_taste = taiyaki_tastes[order] #①味配列の中から注文の味を取り出します
making_taiyaki = MakingTaiyaki.new(orderd_taste) #さっき受けたオーダーを引数として渡す
making_taiyaki.kiji
making_taiyaki.tasting
making_taiyaki.baking
making_taiyaki.topping

#レジ
puts "「お待たせいたしました。#{orderd_taste}たいやきです。お支払いをお願いします。」"
pay = gets.to_i #お客さんが出したお金
orderd_fee = taiyaki_fees[order] #注文されたたいやきの料金
customer_service.cash(orderd_fee,pay) #注文されたたい焼きの料金とお客さんが支払った金額を引数にわたす