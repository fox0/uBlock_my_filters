#!/usr/bin/env bash
set -e
ping -c 4 8.8.8.8 > /dev/null

FILTER='/var/www/html/advblock.txt'
TMP="$FILTER.tmp"

cat > $TMP << EOF
! Title: RU AdList custom
! Expires: 2 days

yastatic.net/share2/
EOF

URL='https://easylist-downloads.adblockplus.org/advblock+cssfixes.txt'
wget $URL -o /dev/null -O - | tail -n +27 | grep -v '@@||yastatic.net*' >> $TMP

mv $TMP $FILTER
