FROM ubuntu:20.04
WORKDIR /app
RUN apt update && \
	apt-get install -y wget curl tar git vim sudo
RUN DEBIAN_FRONTEND=noninteractive TZ=Asia/Taipei apt-get -y install tzdata
RUN TZ=Asia/Taipei \
&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
&& echo $TZ > /etc/timezone \
&& dpkg-reconfigure -f noninteractive tzdata 
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN curl -fsSL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh && \
	bash /tmp/nodesource_setup.sh && \
	apt-get install -y nodejs
RUN useradd -u 1000 code && \
    echo "code    ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
COPY ./entry.sh .
RUN chmod +x entry.sh
ENTRYPOINT ["./entry.sh"]
