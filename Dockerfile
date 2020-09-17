FROM ruby:2.5.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

# make work dir
RUN mkdir /app_name

# named work dir APP_ROOT
ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

# Add host side Gemfile
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT
