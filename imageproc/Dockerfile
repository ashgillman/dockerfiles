# -*- docker-image-name: "ashgillman/imageproc" -*-
FROM continuumio/anaconda3
MAINTAINER Ashley Gillman "ashley.gillman@csiro.au"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    imagemagick \
    libinsighttoolkit3.20 \
    libinsighttoolkit3-dev \
    insighttoolkit3-examples

CMD ["python"]
