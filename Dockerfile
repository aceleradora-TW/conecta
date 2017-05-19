FROM ruby:2.3-slim

RUN apt-get update && apt-get install -y build-essential libpq-dev postgresql-server-dev-9.4 --no-install-recommends

#Gems
COPY Gemfile* /code/
WORKDIR /code
RUN gem update --system
RUN bundle install

#Code
COPY . /code
EXPOSE 9393:9393
CMD ["rake", "s"]
