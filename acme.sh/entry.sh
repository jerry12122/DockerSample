#!/bin/bash

# install acme.sh
if  [[ ! -f /root/.acme.sh/acme.sh ]]
then
  curl -sSL https://get.acme.sh  | sh -s email=$ACME_EMAIL
fi
if  [[ ! -f /usr/bin/acme.sh ]]
then
  ln -s /root/.acme.sh/acme.sh /usr/bin/acme.sh
  echo [$(date)]  acme.sh has been installed
  acme.sh --set-default-ca --server zerossl
fi

# install set notify
acme.sh --set-notify --notify-level 3
acme.sh --set-notify --notify-mode 0
acme.sh --set-notify --notify-hook telegram
service cron start

# logging
if [[ ! -f /root/.acme.sh/acme.sh.log ]]; then
  touch /root/.acme.sh/acme.sh.log
fi
tail -f /root/.acme.sh/acme.sh.log
