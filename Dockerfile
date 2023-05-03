FROM ruby:3.0.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm
RUN mkdir /myapp
WORKDIR /myapp
RUN npm install --global yarn
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

ADD package.json /myapp/package.json
ADD yarn.lock /myapp/yarn.lock
RUN yarn 
ADD . /myapp
