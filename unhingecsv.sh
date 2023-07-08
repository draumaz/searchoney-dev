#!/bin/sh

cd TRANSCRIPTS/${1}
for i in *.csv; do
  for j in `cat "${i}" | awk -F';' '{print $1}'`; do
    k="$(echo ${j} | sed s/,/:/)"
    sed -i "s/${j}j/${k}/g" "${i}"
  done; printf $i
done
