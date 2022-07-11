# プレイヤー(自分)に「0~2」を入力させるロジック
class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets.chomp
    # 「input_hand」が「0, 1, 2」のいずれかだと繰り返し処理を終了し、それ以外（アルファベットも含む）だと繰り返し処理を継続
    while true
      if input_hand.include?("0") || input_hand.include?("1") || input_hand.include?("2")
        return input_hand.to_i
      else
        puts "数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets.chomp
      end
    end
  end
end

# 相手が「0~2」の値をランダムに生成するロジック
class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに取得
    rand(2)
  end

end

# プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジック
class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"
    # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジック
    if (player_hand == enemy_hand)
      puts "あいこ"
      true
    elsif ((player_hand) - (enemy_hand) + 3) % 3 == 2
      puts "あなたの勝ちです"
      false
    else
      puts "あなたの負けです"
      false
    end
  end
end

# じゃんけんゲームを実行するロジックを書きます。
class GameStart
  def self.jankenpon
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    # 変数「next_game」に「true」を代入しましょう。
    # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
    next_game = true
    while next_game
      # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
      #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end

# クラス名を使ってjankenponメソッドを呼び出します。
GameStart.jankenpon