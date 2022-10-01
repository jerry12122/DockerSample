#!/bin/bash
if which hexo > /dev/null
then
    echo "Hexo has already been installed."
else
    cd /app/volumes/code/hexo
    npm install hexo-cli -g
    npm i
fi
/usr/bin/code-server /app