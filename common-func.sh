#!/bin/bash
# Useful functions

# timestamp returns seconds from epoch
timestamp() {
    date +%s
}

# timestamp_diff take number of seconds and subtract it from current seconds from epoch
timestamp_diff() {
    if [ -n "$1" ]
    then
        local SEC_DIFF
        local SEC_START
        local SEC_END

        SEC_START=$1
        SEC_END=$(timestamp)
        SEC_DIFF=$((SEC_END - SEC_START))
        echo $SEC_DIFF
    fi 
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

        MSG="$(date +%F\ %H:%M:%S) VM $VM: $1"

        # Calculate period from seconds since epoch given as $2 and current seconds.
        if [ -n "$2" ]
        then
            SEC=$(timestamp_diff $2)
            MSG+=" takes $(sec_to_period $SEC)"
        fi

        echo $MSG 
    fi
}

# Get human-readable size of given file
file_size_human() {
    if (( $# == 1 ))
    then
        if [ -e "$1" ]
        then
            stat --format="%s" "$1" | numfmt --to=iec
        fi
    fi
}
