FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive

ADD install.sh install.sh
RUN bash install.sh && rm install.sh

VOLUME ["/source"]
WORKDIR /source
CMD ["bash"]