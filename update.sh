#!/usr/bin/env bash
set -e
ping -c 4 8.8.8.8 > /dev/null

FILTER='/var/www/html/advblock.txt'
TMP="$FILTER.tmp"
cat > $TMP << EOF
! Title: RU AdList custom
! Expires: 1 day

EOF
URL='https://easylist-downloads.adblockplus.org/advblock+cssfixes.txt'
wget $URL -o /dev/null -O - | tail -n +27 | \
 grep -v '@@||yastatic.net*' | \
 grep -v '@@||vk.com/js/api/*' >> $TMP
mv $TMP $FILTER

FILTER='/var/www/html/easyprivacy.txt'
TMP="$FILTER.tmp"
cat > $TMP << EOF
! Title: EasyPrivacy custom
! Expires: 1 day

EOF
URL='https://easylist.to/easylist/easyprivacy.txt'
wget $URL -o /dev/null -O - | tail -n +7 | \
 grep -v '@@||youtube.com/api/stats/*' >> $TMP
mv $TMP $FILTER
