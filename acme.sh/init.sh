#!/bin/bash
ISSUE="/usr/bin/acme.sh --server zerossl --register-account -m ${ACME_EMAIL} --issue --force --log"
CERT_LOCATION=""
if [ $# -ne 0  ]; then
    CERT_LOCATION="${1%/}"
    INSTALL="/usr/bin/acme.sh --install-cert --key-file $CERT_LOCATION/cert.key --fullchain-file $CERT_LOCATION/cert.pem --log"
    shift
    ISSUE=$(echo "$ISSUE --dns $1")
    shift

    while [ $# != 0 ]
    do
        ISSUE=$(echo $ISSUE -d "$1")
        INSTALL=$(echo $INSTALL -d "$1")
        shift
    done
else
    echo "Usage: \"./init.sh cert_location dns_api domain1 domain2...\"";
    exit
fi
echo $ISSUE
echo $INSTALL
