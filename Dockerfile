# Use the official Ruby image
FROM ruby:2.6.5

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set working directory
WORKDIR /app

# Copy Gemfiles
COPY Gemfile Gemfile.lock ./

# Install the required Bundler version first
RUN gem install bundler:2.3.6

# Install gems
RUN bundle install

# Copy the rest of the application
COPY . .

# Expose port and set default command
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
