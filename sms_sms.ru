#!/bin/bash

# Send sms by sms.ru

source /root/config

API_ID="${SMSRU_API_ID}"
FROM="${PHONE_FROM}"

TO=$1
SUBJECT="$2"
#BODY="$3"

RES=($(curl -d "text=$SUBJECT" http://sms.ru/sms/send\?api_id=${API_ID}\&from=${FROM}\&to=${TO}))

RETCODE=${RES[0]}
MSGID=${RES[1]}
BALANCE=${RES[2]}

if [ "$RETCODE" == "100" ]
then
    echo "Message was sent with id:$MSGID, balance:$BALANCE"
else
    echo "Error sending message, code:$RETCODE"
fi

