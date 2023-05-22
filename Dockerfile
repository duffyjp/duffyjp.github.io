# Use the ruby alpine base image
FROM ruby:latest

# Install build dependencies

# Needed for gcompat
ENV LD_LIBRARY_PATH=/lib:/usr/lib

# Set the working directory
WORKDIR /app

# Install Jekyll and any other dependencies
RUN gem install jekyll bundler


# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile* ./

# Install gems
RUN bundle install

# Copy the rest of the project files to the working directory
COPY . .

# Expose the default Jekyll development server port (4000)
EXPOSE 4000

# Start the Jekyll development server
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
