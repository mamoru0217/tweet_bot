tabetai_bot @mamorunomamoru1
=========

機能
１ 定期的につぶやく
２ メンションを貰ったらリプライを返す。（すでにツイートした宛にはツイートしないようになっています）

言語 : Ruby2.0
サーバー : heroku
データベース : MongoHQ (herokuのアドオン)

参考にした記事
・「Herokuを使って1日1回名言をツイートするTwitter Botの作り方」 - http://blog.ruedap.com/entry/20110209/ruby_heroku_twitter_bot
※Herokuを利用して、Twitter Botを作成する手順が書いてあるページ。ただ、cron（定期的にプログラムを実行するためのごにょごにょ）についての記述は古い。

・「時計仕掛けのHeroku」 - http://lab.synergy-marketing.co.jp/blog/tech/heroku-addons-scheduler
※上記の記事で古いcronについての記事。まずは上の手順でつくってしまって、その後にこれを見て移行作業（正確には違うけど）すればうまくいく。

・「Twitter Botを、RubyとMongoHQを使って作ってみたのでまとめておく」 - http://soplana.hateblo.jp/entry/2012/03/30/000546
※すでにツイートした相手（メンション）を保存しておくためのデータベースの設定について。github上にソースが公開されていてかなり参考になる。

・「プログラミング未経験者でもできる、 Ruby を使った Twitter の bot の作り方（第二章）」 - http://d.hatena.ne.jp/syo00/20100606/1275840369
・「Twitterでフォロー返し・お礼メンションを送るRubyスクリプト」http://d.hatena.ne.jp/poti0/20120425/1335363064

そして、各種ドキュメント
The Twitter Ruby Gem - http://rdoc.info/gems/twitter
Ruby 2.0 - http://www.ruby-doc.org/core-2.0/
Ruby Twitter Gem簡易リファレンス - http://route477.net/w/?RubyTwitterJa