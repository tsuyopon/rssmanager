# rssmanager_ios
----

# 概要
Yahoo Rss情報を取得してログに出力させるます。
RssManagerという管理クラスをシングルトンで実装しています。
(機能不足なのであくまでも個人の勉強用です)

# 使い方
cloneしてxcodeprojをopenします。
```
$ git clone https://github.com/tsuyopon/rssmanager.git
$ open rssmanager.xcodeproj
```

ビルドできるターゲットとしては以下の2つしかありませんので追加します。
* rssmanager
 * RssManagerライブラリを生成するターゲットです
* CreateAppleDoc
 * AppleDocを生成するターゲットです

ターゲットの項目を選択して「Manages Scheme」を選択します。  
その後、「+」ボタンを押下してRssManagerSampleを追加します。  

これでビルドして、ログをみるとYahooのRSSから取得してその結果をログに出力していることが確認できます。

注意
以下の２つのターゲットはデフォルトで生成されたままで何も手を入れていません。
* rssmanagerTests
* RssManagerSampleTests
