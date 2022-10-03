FROM ubuntu:20.04

WORKDIR /app
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive TZ=Asia/Taipei apt-get -y install tzdata 
RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata 
RUN apt-get install -y wget curl tar git vim sudo php-cli php-curl unzip jq cron
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
WORKDIR /tmp
RUN useradd -u 1000 aaa && \
    echo "aaa    ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers.d/aaa
USER aaa
RUN git clone https://github.com/hitrov/oci-arm-host-capacity.git && sudo mv oci-arm-host-capacity/ /oci && sudo chmod 777 /oci
WORKDIR /oci
RUN composer install --ignore-platform-reqs
USER root
RUN userdel aaa
RUN rm -rf /etc/sudoers.d/aaa
WORKDIR /entry
COPY ./entry.sh /entry/
RUN chmod +x entry.sh
ENTRYPOINT ["./entry.sh"]
