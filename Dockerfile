FROM alpine:latest
RUN apk add --no-cache curl unzip \
    && curl -L https://github.com/nats-io/natscli/releases/download/v0.3.0/nats-0.3.0-linux-amd64.zip -o nats.zip \
    && unzip nats.zip -d /usr/local/bin \
    && chmod +x /usr/local/bin/nats \
    && rm nats.zip

CMD ["sleep", "infinity"]