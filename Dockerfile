FROM ruby:3.0.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev node.js
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
#ADD . /myapp

#CMD bundle exec rails s -p 3000 -b '0.0.0.0'
#CMD bundle exec rails s
