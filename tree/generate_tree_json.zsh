#!/bin/zsh
set -e
ROOTS=(/Library/WebServer/Documents/nutopia ~/QUIN/AIA/NUTOPIA /Volumes/NUTOPIA)
OUT=tree.json
tmp=$(mktemp)
printf '[' > $tmp
first=1
for R in $ROOTS; do
  url=""
  if [[ "$R" == "/Library/WebServer/Documents/nutopia" ]]; then url="https://quin.local/nutopia/"; fi
  [[ $first -eq 0 ]] && printf ',' >> $tmp
  first=0
  printf '{"name":"%s","url":"%s","children":[' "${R//\"/\\\"}" "${url//\"/\\\"}" >> $tmp
  cfirst=1
  while IFS= read -r D; do
    rel="${D#$R}"
    [[ -z "$rel" ]] && continue
    [[ $cfirst -eq 0 ]] && printf ',' >> $tmp
    cfirst=0
    furl="$url${rel#/}"
    printf '{"name":"%s/","url":"%s"}' "${rel//\"/\\\"}" "${furl//\"/\\\"}" >> $tmp
  done < <(find "$R" -type d -maxdepth 3)
  while IFS= read -r F; do
    rel="${F#$R}"
    [[ -z "$rel" ]] && continue
    furl="$url${rel#/}"
    printf ',{"name":"%s","url":"%s"}' "${rel//\"/\\\"}" "${furl//\"/\\\"}" >> $tmp
  done < <(find "$R" -type f -maxdepth 2)
  printf ']}' >> $tmp
done
printf ']' >> $tmp
mv "$tmp" "$OUT"
