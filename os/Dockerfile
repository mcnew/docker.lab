FROM debian:8

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		unzip \
	&& rm -rf /var/lib/apt/lists/* \
&& echo 'deb http://httpredir.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8
