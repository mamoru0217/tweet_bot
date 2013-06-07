# -*- encoding: utf-8 -*-

require 'rubygems'
require 'twitter'


class Tweet
    
    def initialize
        @text = @text = <<-EOF.split("\n")
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
        
        Twitter.configure do |config|
            config.consumer_key       = 'Y10UPf0Kx86dWav73nW9g'
            config.consumer_secret    = 'Wus1XPNxCXymUcDqzVoGOYqaTRZAxT4UXlzOTI3j8'
            config.oauth_token        = '1472870293-rAmWJ8hQXFbeBhZoh4HXh6kY3s1E20jHYPQx9fi'
            config.oauth_token_secret = 'JEen7vLJu2O8qOr5mr9vYO5HzrlfK6FEhq7ebyyJw'
        end

    end

    tweets = Twitter.mentions({:count => 1})

    tweets.each do |t|
        name = "#{t.user.screen_name}"
        Twitter.update("@" + name + "今日のおすすめは鯖の味噌煮です。" )
    end

    def random_tweet
        tweet = @text[rand(@text.length)]
        update(tweet)
    end
    
    def daily_tweet
        tweet = @text[Time.now.day - 1]
        update(tweet)
    end
    
    private
    def update(tweet)
        return nil unless tweet
        
        begin
            Twitter.update(tweet.chomp)
            rescue => ex
            nil # todo
        end
    end
    
end