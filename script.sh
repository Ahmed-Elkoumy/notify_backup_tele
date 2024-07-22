#!/bin/bash

# Variables
CHAT_ID="<Chat ID>"
BOT_TOKEN="<Bot TOKEN >"
URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage"
HOSTNAME=$(hostname)


today=$(date +'%d-%m-%Y')

# Search for the word "OK"
results=$(grep "$today" /orkitools/auditreport.txt | grep 'OK')

if [ -z "$results" ]; then
  # If "OK" was not found, search for the other words and add "Error"
  results=$(grep "$today" /orkitools/auditreport.txt | grep -E 'successfully|succeeded')
  # Now search for "Error" in the same file
  error_results=$(grep "$today" /orkitools/auditreport.txt | grep -E 'ERROR|70%')
  OUTPUT="$results\n$error_results"
else
  # If "OK" was found, output the results
  OUTPUT="$results"
fi

# Create the message to send
MESSAGE="Hostname: $HOSTNAME Output: $OUTPUT"

# Send the output to Telegram
curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MESSAGE" -d parse_mode=HTML

