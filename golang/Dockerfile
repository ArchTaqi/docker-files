FROM ubuntu:latest

ARG GO_VER="1.9.3"
RUN apt-get update && apt-get -y full-upgrade

RUN apt-get -y install apt-transport-https ca-certificates wget software-properties-common
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN wget https://dl.google.com/go/go${GO_VER}.linux-amd64.tar.gz -O /tmp/go${GO_VER}.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf /tmp/go${GO_VER}.linux-amd64.tar.gz

RUN mkdir -p /root/go/{bin,pkg,src}
ENV GOPATH=$HOME/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

WORKDIR /root/go
