FROM --platform=linux/amd64 ruby:3.1.4

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs
RUN apt-get update -qq && apt-get install -y vim
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install
COPY . /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

COPY ./start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]
