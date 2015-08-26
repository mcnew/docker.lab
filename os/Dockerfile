FROM buildpack-deps:jessie-scm

RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/* \
&& echo 'deb http://httpredir.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8 JAVA_VERSION 8u66 JAVA_DEBIAN_VERSION 8u66-b01-1~bpo8+1
