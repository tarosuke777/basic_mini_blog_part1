FROM ruby:3.0.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm
RUN mkdir /myapp
WORKDIR /myapp
RUN npm install --global yarn
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

ADD package.json /myapp/package.json
#ADD package-lock.json /myapp/package-lock.json
ADD yarn.lock /myapp/yarn.lock
#RUN npm install
RUN yarn 
#ADD . /myapp

#CMD bundle exec rails s -p 3000 -b '0.0.0.0'
#CMD bundle exec rails s
