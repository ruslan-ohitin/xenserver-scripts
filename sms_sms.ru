#!/bin/bash

# Send sms by sms.ru

source /root/config

API_ID="${SMSRU_API_ID}"
FROM="${PHONE_FROM}"

TO=$1
SUBJECT="$2"
BODY="$3"

curl -d "text=$SUBJECT" http://sms.ru/sms/send\?api_id=${API_ID}\&from=${FROM}\&to=${TO}
