#!/bin/bash

cd /searchoney

search() {
  for LINE in TRANSCRIPTS/*/*.csv; do
    cat "${LINE}" | \
      grep \
        -i \
        --color="auto" \
        -B2 \
        -A2 \
        "${INPUT}" && printf "${LINE}\n\n"
  done
}

clear

cat << EOF
=====================================
SearchOney, by draumaz (2023)
https://github.com/draumaz/SearchOney
=====================================
EOF

while true; do
  printf "\ntype exit to leave.\n\n>> "
  read INPUT
  case $INPUT in
    exit|leave) exit 0 ;;
    search|*) echo ""; search INPUT ;;
  esac
done
