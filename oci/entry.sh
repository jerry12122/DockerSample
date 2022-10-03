#!/bin/bash
cd /app
FILE=/app/oci
if [[ -d $FILE ]];  then
    if [[ -f "$FILE/.env" ]]; then
        echo .env exist
        
        crontab -r 
        echo "* * * * * echo [\$(date)] \$(/usr/bin/php /app/oci/index.php) >> /log/oci.log" >> mycron
        crontab mycron
        rm mycron
        service cron restart
        if [[ ! -d "/log" ]];  then
            mkdir -p /log
            touch /log/oci.log
        fi
        tail -f /log/oci.log
    else
        echo .env not exist
        cp /app/oci/.env.example /app/oci/.env
        bash /entry/entry.sh
    fi
else
    echo $FILE not exist
    cp -r /oci /app/
    bash /entry/entry.sh
fi
