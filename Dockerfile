FROM ruby:2.5.3-alpine
MAINTAINER Purchasing Squad <the-money-purchasing-squad@rea-group.com>

RUN apk update && apk upgrade

# Clean apk cache
RUN rm -rf /var/cache/apk/*


WORKDIR /app

ADD Gemfile Gemfile.lock ./

#do the build dependencies step
RUN apk --no-cache --virtual .build-deps add gcc make g++ && \
    bundle install --jobs 8 --retry 3 && \
    apk del .build-deps

COPY . /app

CMD ["bin/run"]
