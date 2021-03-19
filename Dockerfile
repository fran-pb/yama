FROM ruby:3.0.0

RUN apt-get update -qq && \
  apt-get install -y build-essential libpq-dev

RUN cp /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime

RUN mkdir -p /app
WORKDIR /app

RUN gem install bundler

COPY docker-entrypoint.sh ./
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
