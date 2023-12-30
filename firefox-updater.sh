#!/bin/bash

ask='curl -s https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US'

download="$($ask | cut -d "\"" -f 2)"
new_version="$($ask | cut -d "\"" -f 2 | cut -d "/" -f 7)"
actual_version="$(cat ${HOME}/.config/firefox-updater/actual_version 2>/dev/null || mkdir -p ${HOME}/.config/firefox-updater && echo '')"

if [[ $($ask | grep Found) ]]; then
 if [[ $new_version != $actual_version ]]; then
  curl -sL $download > /tmp/f.tar.bz2 && tar -xf /tmp/f.tar.bz2 -C /opt/ && echo "$new_version" > ${HOME}/.config/firefox-updater/actual_version
  rm /tmp/f.tar.bz2
  fi
fi
