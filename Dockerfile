FROM ruby:2.6
LABEL maintainer="m@taiki.dev"

ENV RACK_ENV production
ENV APP_FILE /app/main.rb

RUN gem install sinatra

COPY start.sh /
RUN mkdir -p /app
COPY main.rb /app/

WORKDIR /app
EXPOSE 80
CMD ["/bin/bash", "/start.sh"]
