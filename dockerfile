# Use the official Ruby image
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs npm

# Set the working directory
WORKDIR /myapp

# Add Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Running pending migrations
RUN rails db:migrate

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["rails", "server", "-b", "0.0.0.0"]
