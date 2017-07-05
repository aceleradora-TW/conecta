FROM ruby:2.3-slim

RUN apt-get update && apt-get install -y build-essential libpq-dev postgresql-server-dev-9.4 --no-install-recommends
RUN apt-get install -y wget
RUN apt-get install -y libfontconfig
RUN cd ~
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xvfj phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs usr/local/bin/
RUN rm -rf phantomjs-2.1.1-linux-x86_64/

#Gems
COPY Gemfile* /code/
WORKDIR /code
RUN gem update --system
RUN bundle install
ENV LANG C.UTF-8
EXPOSE 9393:9393
CMD ["rake", "s"]
