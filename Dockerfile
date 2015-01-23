FROM pataquets/ubuntu:trusty

RUN \
	echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list && \
	wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add - && \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive \
		apt-get install -y newrelic-daemon && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "newrelic-daemon", "-f" ]
CMD [ "-s" ]
