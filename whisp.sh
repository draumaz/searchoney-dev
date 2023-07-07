#!/bin/bash

cd /mnt/emma/searchoney

cat << EOF
[searchoney.draumaz.xyz] <transcribe monitor>
=============================================

EOF

for SEC in `cd transcript; find . -maxdepth 1 -type d -not -name 'complete'|cut -c3-|sort`; do
  MOST_RECENT=$(ls --color=no transcript/*/*.csv -ltcr|tail -1|awk '{print $9}'|tr '/' ' '|awk '{print $2}')
  TRANS_COUNT=$(expr `ls -l transcript/${SEC}{,/complete} 2>/dev/null|wc -l` - 1)
  TRANS_TOTAL=$(expr ${TRANS_TOTAL} + ${TRANS_COUNT})
  AUDIO_COUNT=$(expr `ls -l audio/16bit/${SEC}|wc -l` - 1)
  AUDIO_TOTAL=$(expr ${AUDIO_TOTAL} + ${AUDIO_COUNT})
  printf "${SEC} - [${TRANS_COUNT}/${AUDIO_COUNT}]"
  case ${MOST_RECENT} in ${SEC}) echo " <-" ;; *) echo "" ;; esac
done

printf "\nTOTAL - [${TRANS_TOTAL}/${AUDIO_TOTAL}]\n"
