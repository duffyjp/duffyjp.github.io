# syntax=docker/dockerfile:1

FROM docker.io/ruby:3.2.2

# Set the working directory
WORKDIR /jekyll

RUN gem install bundler
