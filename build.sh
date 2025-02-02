#!/bin/bash
sed -i '/^### DATA ###$/q' tofi-emoji

curl https://raw.githubusercontent.com/muan/emojilib/v3.0.6/dist/emoji-en-US.json \
  | jq --raw-output '. | to_entries | .[] | .key + " " + (.value | join(" ") | sub("_"; " "; "g"))' \
  >> tofi-emoji
