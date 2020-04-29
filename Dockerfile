FROM ruby:2.5.8
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN apt-get update -y && apt-get --assume-yes install freetds-dev freetds-bin
RUN bundle install
COPY . /myapp

