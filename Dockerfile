# syntax=docker/dockerfile:1.4
FROM nginx:alpine

# Copy config nginx
COPY .nginx/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*

# Copy static assets from builder stage
COPY ./build .
EXPOSE 8000

# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]
