FROM ruby:2.5.3-slim

RUN apt-get update -qq \
  && apt-get install -y build-essential default-libmysqlclient-dev \
  && rm -rf /var/lib/apt/lists/* \
  && gem update

WORKDIR /app
COPY Gemfile /app/

COPY Gemfile.lock /app/

RUN bundle install -j4

EXPOSE  3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
