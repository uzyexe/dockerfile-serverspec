FROM ruby:2.3.1-alpine

ENV SERVERSPEC_VERSION 2.37.2
ENV RAKE_VERSION 11.3.0

RUN gem install serverspec -v ${SERVERSPEC_VERSION} \
    && gem install rake -v ${RAKE_VERSION}

WORKDIR /serverspec

CMD /usr/local/bin/rake -T
