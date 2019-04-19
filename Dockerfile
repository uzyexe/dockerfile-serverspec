FROM ruby:2.6-alpine

ENV SERVERSPEC_VERSION 2.41.3
ENV RUBOCOP_VERSION 0.67.2

RUN gem install serverspec -v ${SERVERSPEC_VERSION} --no-ri --no-rdoc && \
    gem install rubocop -v ${RUBOCOP_VERSION} --no-ri --no-rdoc

WORKDIR /serverspec

ENTRYPOINT ["/usr/local/bin/rake"]
CMD ["--tasks"]
