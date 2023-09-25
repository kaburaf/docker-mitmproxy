FROM alpine:latest

COPY certs/mitmproxy-ca.pem /usr/local/share/ca-certificates/mitmproxy-ca.pem
RUN cat /usr/local/share/ca-certificates/mitmproxy-ca.pem >> /etc/ssl/certs/ca-certificates.crt
RUN rm /usr/local/share/ca-certificates/mitmproxy-ca.pem 
RUN apk update && apk upgrade && apk add nodejs npm
USER 1000:1000
ENV NODE_OPTIONS=--openssl-legacy-provider
