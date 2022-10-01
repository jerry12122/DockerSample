FROM ubuntu:20.04
RUN apt update && \
	apt-get install -y wget curl tar git cron socat git && \
	DEBIAN_FRONTEND=noninteractive TZ=Asia/Taipei apt-get -y install tzdata
RUN TZ=Asia/Taipei \
&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
&& echo $TZ > /etc/timezone \
&& dpkg-reconfigure -f noninteractive tzdata 
WORKDIR /app
COPY ./entry.sh .
RUN chmod +x ./entry.sh
VOLUME /acme
ENTRYPOINT ["/bin/bash","-c","/app/entry.sh"]
