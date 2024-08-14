FROM alpine AS builder
WORKDIR /www

COPY . .

RUN apk add --no-cache hugo
RUN hugo --ignoreCache

FROM nginx:alpine

COPY --from=builder /www/public /usr/share/nginx/html
