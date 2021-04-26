#!/bin/bash

# Set default download path below
# Do not change format (NO prefix/suffix slashes)

STORAGE_PATH="path/to/default/directory"

download_list () {
    local LIST_ID="${1}"
    local PATH_FILE="${STORAGE_PATH}/"
    local PATH_ARCHIVE="${STORAGE_PATH}/"

    if [[ -n "${2}"]]; then
        [ ! -d "${STORAGE_PATH}/${2}" ] && mkdir "${STORAGE_PATH}/${2}"

        PATH_FILE+="${2}"
        PATH_ARCHIVE+="${2}"
    fi

    # Feel free to edit filename formatting
    PATH_FILE+="/%(upload_date)s_%(title)s.%(ext)s"
    PATH_ARCHIVE+="/.archive"

    # Feel free to edit the youtube-dl flags to suit your preference
    youtube-dl -o $PATH_FILE --download-archive $PATH_ARCHIVE -f best --add-metadata --all-subs --convert-subs srt --embed-subs --abort-on-unavailable-fragment --abort-on-error -i $LIST_ID
}

while :
do
    while read DATA; do
        if [[ -n "${DATA}" && "${DATA}" != *"#"* ]]; then
            DATA_ARRAY=($DATA)
            download_list "${DATA_ARRAY[0]}" "${DATA_ARRAY[1]}"
        fi
    done < list
    # Change how long to rest before scanning for new videos
    sleep 1800
done