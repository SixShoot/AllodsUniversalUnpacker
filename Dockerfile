FROM debian:latest

RUN apt-get update \
    && apt-get install -y gnupg2 apt-transport-https ca-certificates \
    && apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv 379CE192D401AB61 \
    && echo "deb https://dl.bintray.com/kaitai-io/debian_unstable jessie main" | tee /etc/apt/sources.list.d/kaitai.list \
    && apt-get update \
    && apt-get install -y kaitai-struct-compiler

ENTRYPOINT ["/usr/bin/kaitai-struct-compiler"]
CMD ["--help"]
