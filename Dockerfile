FROM ruby:2.2.5-slim

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install

WORKDIR /serverspec
VOLUME /serverspec

CMD /usr/local/bin/rake -T
