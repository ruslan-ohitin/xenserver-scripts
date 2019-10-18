#!/bin/bash

# Send sms by sms.ru

source /root/config

API_ID="${SMSRU_API_ID}"
FROM="${PHONE_FROM}"

TO=$1
SUBJECT="$2"
#BODY="$3"

RES=($(curl -s -S -d "text=$SUBJECT" http://sms.ru/sms/send\?api_id=${API_ID}\&from=${FROM}\&to=${TO}))

RETCODE=${RES[0]}
MSGID=${RES[1]}
BALANCE=${RES[2]}

if [ "$RETCODE" == "100" ]
then
    echo "Message \"$SUBJECT\" was sent with id:$MSGID, $BALANCE"
else
    echo "Error sending message, code:$RETCODE"
fi

