require 'rubygems'    # ←Ruby 1.9では不要
require 'twitter'
require 'pp'


Twitter.configure do |config|
    config.consumer_key       = 'Y10UPf0Kx86dWav73nW9g'
	config.consumer_secret    = 'Wus1XPNxCXymUcDqzVoGOYqaTRZAxT4UXlzOTI3j8'
    config.oauth_token        = '1472870293-rAmWJ8hQXFbeBhZoh4HXh6kY3s1E20jHYPQx9fi'
    config.oauth_token_secret = 'JEen7vLJu2O8qOr5mr9vYO5HzrlfK6FEhq7ebyyJw'
end

 tweets = Twitter.mentions({:count => 1})

 tweets.each do |t|
   name = "#{t.user.screen_name}"
   Twitter.update("@" + name + "ありがとう!")
 end