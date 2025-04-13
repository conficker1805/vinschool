FROM ruby:3.4.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Create app directory
WORKDIR /app

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy app code
COPY . .

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
