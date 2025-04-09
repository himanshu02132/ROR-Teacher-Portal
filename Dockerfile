# Use official Ruby image as base
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set working directory
WORKDIR /app

# Copy Gemfiles first to leverage Docker cache
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the app code
COPY . .

# Precompile assets (if using Rails asset pipeline)
RUN bundle exec rake assets:precompile

# Expose port Rails runs on
EXPOSE 3000

# Start Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
