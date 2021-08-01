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

## 
7/25 16:00-16:30
7/25 16:45-17:30

7/31 20:30-21:15

8/1 09:00-09:15
      09:30-10:00
      12:00-12:20
      14:30-15:00

## 要件
・短文の投稿にはユーザー登録が必要
・ログインすると短文を投稿できるようになる
・ユーザー情報は以下の通り
　・ログイン情報
　　・ユーザー名（アルファベットのみ、スペース禁止、20文字以内）
　　・パスワード
　・ユーザー情報
　　・非公開情報
　　　・パスワード
　　・公開情報
　　　・ユーザー名
　　　・プロフィール（200文字以内）
　　　・ブログURL
・公開情報は各ユーザーのプロフィールページから閲覧することができる