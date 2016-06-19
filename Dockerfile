FROM ruby:2.2.5-alpine

WORKDIR /serverspec

COPY Gemfile /serverspec/
COPY Gemfile.lock /serverspec/
RUN bundle install

CMD /usr/local/bin/rake -T
