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

heroku run rails db:migrate

heroku logs -t 