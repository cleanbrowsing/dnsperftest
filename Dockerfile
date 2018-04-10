FROM alpine:latest
RUN apk --no-cache add bash bc drill \
    && mkdir /app \
    && wget https://raw.githubusercontent.com/cleanbrowsing/dnsperftest/master/dnstest.sh -O /app/dnstest.sh \
    && chmod +x /app/dnstest.sh

ENTRYPOINT ["/app/dnstest.sh"]
