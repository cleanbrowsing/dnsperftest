FROM ubuntu:16.04
RUN apt update && apt install -yq git bc dnsutils
RUN git clone --depth=1 https://github.com/cleanbrowsing/dnsperftest/ /app

ENTRYPOINT ["/app/dnstest.sh"]
