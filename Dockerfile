FROM ruby:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Install shush
RUN curl -sL -o /usr/local/bin/shush \
    https://github.com/realestate-com-au/shush/releases/download/v1.3.3/shush_linux_amd64 \
 && chmod +x /usr/local/bin/shush

ADD Gemfile* /app/


CMD ["ruby", "app.rb"]
