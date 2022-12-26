FROM ruby:3.1.2-slim-bullseye

RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential 

RUN gem update --system && \
    gem install bundler

COPY Gemfile ./

RUN bundle install

CMD bundle exec ruby -e "require 'cld3'"