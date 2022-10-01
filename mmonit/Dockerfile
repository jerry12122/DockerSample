FROM ubuntu:20.04
RUN apt update && \
	apt-get install -y wget curl tar
RUN DEBIAN_FRONTEND=noninteractive TZ=Asia/Taipei apt-get -y install tzdata
RUN TZ=Asia/Taipei \
&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
&& echo $TZ > /etc/timezone \
&& dpkg-reconfigure -f noninteractive tzdata 
WORKDIR /app
RUN wget https://mmonit.com/dist/mmonit-3.7.12-linux-x64.tar.gz && \
	tar zxvf mmonit-3.7.12-linux-x64.tar.gz && \
	rm mmonit-3.7.12-linux-x64.tar.gz && \
	mv mmonit-3.7.12 mmonit
RUN sed -i 's/port="8080"/port="80"/' /app/mmonit/conf/server.xml
CMD ["/app/mmonit/bin/mmonit","-i"]
