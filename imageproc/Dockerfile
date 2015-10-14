FROM continuumio/anaconda3
MAINTAINER Ashley Gillman "ashley.gillman@csiro.au"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    imagemagick

CMD ["python"]
