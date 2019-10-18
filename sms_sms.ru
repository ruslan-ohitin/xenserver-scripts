#!/bin/bash

# Send sms by sms.ru

# Get directory where this script is                                                                               
# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Import config
source "$DIR/config"

API_ID="${SMSRU_API_ID}"
#FROM="${PHONE_FROM}"

TO=$1
SUBJECT="$2"
#BODY="$3"

RES=($(curl -s -S -d "msg=$SUBJECT" http://sms.ru/sms/send\?api_id=${API_ID}\&to=${TO}))

RETCODE=${RES[0]}
MSGID=${RES[1]}
BALANCE=${RES[2]}

if [ "$RETCODE" == "100" ]
then
    echo "Message \"$SUBJECT\" was sent with id:$MSGID, $BALANCE"
else
    echo "Error sending message, code:$RETCODE"
fi

