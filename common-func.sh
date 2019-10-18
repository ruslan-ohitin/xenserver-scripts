#!/bin/bash
# Useful functions

# timestamp returns seconds from epoch
timestamp() {
    date +%s
}

# Get number of seconds and return human readable string with days, hours, minutes and seconds.
# sec_to_period seconds
sec_to_period() {
    local SEC
    local DAYS
    local RES

    SEC=$1
    RES=""

    let DAYS="$SEC/86400"
    if ((DAYS > 0 ))
    then
        RES+="$DAYS days "
    fi

    echo "${RES}$(date -ud@$SEC +%H:%M:%S)"
}

# Writing log message with vm name and timestamp
# log_message "MESSAGE" [seconds at precess start]
log_message() {
    if [ -n "$1" ]
    then
        local MSG
        local SEC
        local SEC_START
        local SEC_END

        MSG="$(date +%F\ %H:%M:%S) VM $VM: $1"

        # Calculate period from seconds since epoch given as $2 and current seconds.
        if [ -n "$2" ]
        then
            SEC_START=$2
            SEC_END=$(timestamp)
            let SEC="$SEC_END - $SEC_START"
            MSG+=" takes $(sec_to_period $SEC)"
        fi

        echo $MSG 
    fi
}

