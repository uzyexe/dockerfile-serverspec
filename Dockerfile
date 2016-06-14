FROM ruby:2.2.4-slim

ENV SERVERSPEC_VERSION 2.36.0

RUN gem install serverspec -v ${SERVERSPEC_VERSION} && \
    mkdir /serverspec

VOLUME  /serverspec
WORKDIR /serverspec

CMD /usr/local/bin/rake -T
