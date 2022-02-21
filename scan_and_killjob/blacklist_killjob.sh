#!/bin/bash

while IFS='' read -r LINE || [ -n "${LINE}" ]; do
    ps -Af | grep "${LINE}" | grep -v grep | awk '{print$2}' | xargs sudo kill -9
done < blacklist
