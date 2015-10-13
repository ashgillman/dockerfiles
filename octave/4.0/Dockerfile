FROM debian:jessie
MAINTAINER Ashley Gillman "ashley.gillman@csiro.au"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    software-properties-common
RUN apt-add-repository ppa:octave/stable
RUN apt-get update && apt-get install -y \
    octave

CMD ["octave"]
