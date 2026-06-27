FROM ruby:3.2-slim
WORKDIR /app
COPY Gemfile .
RUN bundle install
COPY . .
EXPOSE 4567
CMD ["ruby", "src/app.rb"]
