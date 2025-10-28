FROM alpine:latest
RUN apk add --no-cache curl unzip \
    && curl -L https://github.com/nats-io/natscli/releases/download/v0.3.0/nats-0.3.0-linux-amd64.zip -o nats.zip \
    && mkdir -p /usr/local/bin \
    && unzip nats.zip -d /tmp \
    && cp /tmp/nats-0.3.0-linux-amd64/nats /usr/local/bin/nats \
    && chmod +x /usr/local/bin/nats \
    && rm nats.zip

CMD ["sleep", "infinity"]
