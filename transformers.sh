#!/bin/bash

markdown() {
  for FILE in TRANSCRIPTS/*/*.csv; do
    while read line; do
      echo -e "> ${line}\n\n" >> "${FILE}".md
    done < "${FILE}"
    sed -i 's/;/,/g' "${FILE}.md"
    mv -v "${FILE}".md "`echo ${FILE}.md | sed s/.csv//`"
  done
}

json() {
  for i in TRANSCRIPTS/${1}/*.csv; do
    csvjson -d ';' "${i}" > "${i}.json.pre"
    cat >> "${i}".json << EOF
{ "Data":
`cat "${i}.json.pre" | jq`
}
EOF
    rm -v "${i}.json.pre"
  done
}

"${@}"
