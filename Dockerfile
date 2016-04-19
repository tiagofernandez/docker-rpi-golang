
# Pull base image
FROM resin/rpi-raspbian:jessie
MAINTAINER Aaron Picht <https://github.com/apicht/docker-rpi-golang>

# Install dependencies
RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y \
    ca-certificates \
    git \
    curl \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ENV GOROOT_BOOTSTRAP /go
ENV GOLANG_VERSION 1.6.1
ADD ./etc/services /etc/services
RUN \
    curl -Ok https://storage.googleapis.com/golang/go$GOLANG_VERSION.linux-armv6l.tar.gz && \
    tar -xzf go$GOLANG_VERSION.linux-armv6l.tar.gz
    

# Set environment variables
ENV GOROOT /go
ENV GOPATH /gopath
ENV GOARM 6
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

# Define working directory
WORKDIR /gopath

# Define default command
CMD ["bash"]
