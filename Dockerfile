FROM ruby:3.0.1

ENV RAILS_ENV=production
ENV TZ Asia/Tokyo

## nodejsとyarnはwebpackをインストールする際に必要
# yarnパッケージ管理ツールをインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs build-essential libpq-dev postgresql-client yarn
WORKDIR /todo_reminder
COPY Gemfile /todo_reminder/Gemfile
COPY Gemfile.lock /todo_reminder/Gemfile.lock
RUN bundle install

RUN yarn install --check-files
RUN bundle exec rails webpacker:install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]