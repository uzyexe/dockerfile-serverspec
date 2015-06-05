FROM ruby:2.2.2-slim

ENV SERVERSPEC_VERSION 2.17.1

RUN gem install serverspec -v ${SERVERSPEC_VERSION} && \
    mkdir /serverspec

VOLUME  /serverspec
WORKDIR /serverspec

CMD /usr/local/bin/rake -T
