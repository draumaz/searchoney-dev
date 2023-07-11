#!/bin/sh

for FILE in TRANSCRIPTS/*/*.csv; do
  while read line; do
    printf "> ${line}\n\n" >> "${FILE}".md
  done < "${FILE}"
  sed -i 's/;/,/g' "${FILE}"
done

