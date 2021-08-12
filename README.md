# basic_mini_blog_part1
=======
# README

# Documnet
## Haml
https://haml.info/docs/yardoc/file.REFERENCE.html

## Ruby
https://docs.ruby-lang.org/ja/3.0.0/doc/index.html

## Rails
https://railsdoc.com/gem#bundle 

## Webpacker
https://railsguides.jp/webpacker.html

## BootStrap
https://getbootstrap.jp/docs/4.3/getting-started/introduction/

## Git
### clean
git checkout .
git clean -df .

### PUSH
git add .
git commit -m "msg"
git push origin main

## Rails Command
### DB
rails db:migrate:reset

## Bundle
bundle install
bundle list

## haml
rails haml:erb2haml

## heroku 
heroku login
heroku keys:add
git push heroku main

heroku config
heroku config:set BASIC_AUTH_USERNAME=XXXXXX
heroku config:set BASIC_AUTH_PASSWORD=YYYYYY


8/12
10:00-10:15

＜基本要件＞
・デプロイにあたってはHerokuにユーザー登録し、二段階認証を設定すること
・α版として一般に公開するため、サイト全体にBasic認証を適用する
　・RAILS_ENVがproductionの場合のみサイト全体にBasic認証が適用されるようにすること
　・Basic認証に利用するユーザー名、パスワードは環境変数で管理できるようにすること（ユーザー名、パスワードを平文でGithubで管理しないようにするため）
・HerokuアプリをデプロイするためにHerokuアプリを新規に作成すること
　・アプリ名称は自由とする
・Herokuアプリをデプロイし、ここまでの課題で作成した機能の動作を確認すること

＜学習できる内容＞
・development環境とproduction環境の違い
・Herokuへのデプロイを通じたアプリケーションのインターネットへの公開方法

＜技術的な要件＞
・アプリケーションとはSSL/TLSで通信すること
