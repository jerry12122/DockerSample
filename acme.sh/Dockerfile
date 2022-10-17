FROM ubuntu:20.04
RUN apt update && \
	apt-get install -y wget curl tar cron socat jq && \
	DEBIAN_FRONTEND=noninteractive TZ=Asia/Taipei apt-get -y install tzdata
RUN TZ=Asia/Taipei \
&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
&& echo $TZ > /etc/timezone \
&& dpkg-reconfigure -f noninteractive tzdata 
WORKDIR /app
COPY ./*.sh .
RUN chmod +x ./*.sh
RUN service cron start && \
echo "0 0 * * *" "/usr/bin/acme.sh --cron" >> mycron && \
crontab mycron && \
rm mycron
ENTRYPOINT ["/bin/bash","-c","/app/entry.sh"]
