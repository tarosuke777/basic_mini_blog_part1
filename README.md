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

##  4.75h
登録処理：240 
7/25 16:00-16:30 0.5h
7/25 16:45-17:30 0.75h

7/31 20:30-21:15 0.75h

8/1 09:00-09:15 0.25h   2.75
      09:30-10:00 0.5
      12:00-12:30 0.5 
      14:30-15:00 0.5
      15:30-16:15 0.75
      16:30-16:45 0.25
紐づけ処理：75
      19:00-19:30 0.5
      20:00-20:45 0.75

8/2
14:45-15:30
16:00-16:30
17:00-18:00
20:30-20:45

8/8
  12:30-13:00
  13:30-13:45
  13:45-14:15
  14:15-14:30
  15:00-15:30
  16:00-16:45
  17:00-18:30
  19:45-20:15

１．フォローテーブルを追加 3h
２．全体タイムラインとフォローのみのタイムラインに分ける 6h
３．タイムラインにフォローボタンを追加（フォロー済、自分の投稿の場合は表示しない）6h
　→フォロー済判定を実装したが、SQL発行しまくりなので、見直し
４．ユーザプロフィールページにも同様にフォローボタンを追加 1h
５．ユーザの削除処理に紐づきテーブル削除処理を追加 3h

＜基本要件＞
・タイムラインに流れる投稿から他ユーザーをフォローできる
・フォローしたユーザーのみのタイムラインが表示される

＜学習できる内容＞
・再帰的なデータ設計
・has_many throughによるデータ抽出

＜技術的な要件＞
・フォローしたユーザーのみのタイムラインを表示する際、N+1クエリにならないようにhas_many throughを活用し1回のSQLでデータ抽出を行うようにする

