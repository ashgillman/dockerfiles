FROM fiji/fiji:fiji-openjdk-7
MAINTAINER Ashely Gillman <ashley.gillman@csiro.au>

RUN apt-get update && apt-get install -y \
    libjava3d-java

RUN cd /tmp \
    && curl -O http://132.187.25.13/java3d/j3d-1_5_2-linux-amd64.zip \
    && unzip j3d-1_5_2-linux-amd64 \
    && ls \
    && unzip j3d-1_5_2-linux-amd64/j3d-jre.zip \
    && ls \
    && cp -r lib/* /usr/lib/jvm/java-7-openjdk-amd64/jre/lib \
    && ls /usr/lib/jvm/java-7-openjdk-amd64/jre \
    && ls /usr/lib/jvm/java-7-openjdk-amd64/jre/lib \
    && ls /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/ext
