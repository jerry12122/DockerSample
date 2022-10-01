FROM ubuntu:20.04
RUN apt update && \
	apt-get install -y wget curl tar git && \
	DEBIAN_FRONTEND=noninteractive TZ=Asia/Taipei apt-get -y install tzdata
RUN TZ=Asia/Taipei \
&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
&& echo $TZ > /etc/timezone \
&& dpkg-reconfigure -f noninteractive tzdata 
WORKDIR /app
RUN wget https://github.com/jeessy2/ddns-go/releases/download/v4.0.4/ddns-go_4.0.4_Linux_x86_64.tar.gz && tar zxvf ddns-go_4.0.4_Linux_x86_64.tar.gz

ENTRYPOINT ["/bin/sh","-c","./ddns-go"]
