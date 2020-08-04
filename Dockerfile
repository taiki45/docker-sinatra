FROM ruby:2.6
LABEL maintainer="m@taiki.dev"

ENV RACK_ENV production

RUN gem install sinatra

RUN mkdir -p /src
COPY app.rb /src

WORKDIR /src
EXPOSE 80
CMD ["/usr/local/bin/ruby", "/src/app.rb", "-p", "80", "-o", "0.0.0.0"]
