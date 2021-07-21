# Base image for node
FROM node:alpine as builder

WORKDIR '/app'

# Download the dependencies
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# Base package for nginx
FROM nginx
COPY --from=builder /app/build usr/share/nginx/html