#!/bin/bash

for i in TRANSCRIPTS/*/*.csv; do
  csvjson -d ';' "$i" > "$i.json.pre"
  cat >> "${i}".json << EOF
{ "Data":
`cat "${i}.json.pre" | jq`
}
EOF
  rm -v "$i.json.pre"
done
