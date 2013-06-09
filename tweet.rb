# -*- encoding: utf-8 -*-
require 'rubygems'
require 'twitter'
require'./db.rb'

class Tweet
    
    def initialize

        @text = @text = <<-EOF.split("\n") #定期的につぶやくツイートの内容
            今日は卵かけごはんが食べたいな。
            今日は鯖の味噌煮が食べたい。
            今日はビビンバが食べたい。
            今日は天ぷらそばが食べたい。
            今日は焼肉が食べたい。
            今日はきつねうどんが食べたい。
            今日はカルボナーラが食べたい。
            今日はペペロンチーノが食べたい。
            今日はとんかつが食べたい。
            今日は生姜焼きが食べたい。
            今日はラーメンが食べたい。
            今日はおにぎりが食べたい。
            今日は豚汁が食べたい。
            今日はシーザーサラダが食べたい。
            今日はカツオのたたきが食べたい。
            今日は明太子が食べたい。
            今日は海鮮丼が食べたい。
            今日はもつ煮が食べたい。
            今日は焼き鳥が食べたい。
            今日はブリの照焼が食べたい。
            今日はなにも食べたくない。
            今日は牛丼が食べたい。
            今日はカレーが食べたい。
            今日はビーフシチューが食べたい。
            今日はみかんが食べたい。
            今日はキムチ鍋が食べたい。
            今日は鶏の唐揚げが食べたい。
            今日はお刺身が食べたい。
            今日は南蛮揚げが食べたい。
            今日はナスが食べたい。
            今日はなにが食べたい？
            EOF

        @reply = @reply = <<-EOF.split("\n") #リプライに使う内容
            今日のおすすめは焼きなすです！
            今日のおすすめはホワイトシチューです！
            今日のおすすめはブリの照焼です！
            今日のおすすめはチキンカレーです！
            今日のおすすめは鯛のカルパッチョです！
            今日のおすすめはいなりずしです！
            今日のおすすめはチョコレートケーキです！
            今日はペッパーハウスに行きましょう！
            今日はマクドナルドに行きましょう！
            今日は断食してみましょう！
            こんにちは！ハハッ！
            こんばんは！今あなたの後ろにいます！
            こんばんは！
            今日のおすすめはとんこつラーメンです！
            今日のおすすめは鶏の唐揚げです！
            EOF
        
        Twitter.configure do |config| 
            config.consumer_key       = ' '
            config.consumer_secret    = ' '
            config.oauth_token        = ' '
            config.oauth_token_secret = ' '
        end

        @already_tweets = TabetaiDB::AlreadyReply.new #データベースと接続する（？）
    end

    def random_tweet
        tweet = @text[rand(@text.length)] # @textの中からランダムに一文選ぶ
        update(tweet) # 選んだ文をツイート
    end
    
    def reply
        tweet = @reply[rand(@reply.length)]
        mentions = Twitter.mentions #自分へのメンションのタイムラインを取得
        mentions.each do |mention| # eachメソッドによる繰り返し処理
            next unless @already_tweets.find_by_tweet( mention.id ).nil? # データベースの中の"mension_id"を検索する
            Twitter.update("@#{mention.user.screen_name}"+tweet) # 新しい mention_id であれば、そこ宛にツイート
            @already_tweets.create_tweet( mention.id ) # ツイートした先の mention_id をデータベースに格納。
        end
    end
    
    private
    def update(tweet) # random_tweetの"update(tweet)"の定義
        return nil unless tweet
        
        begin
            Twitter.update(tweet.chomp)
            rescue => ex
            nil # todo
        end
    end

end
