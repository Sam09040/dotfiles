#!/bin/bash

file="$1"
ext="${file#*.}"
filePure="${file%.*}"
base="-Wall -o $filePure $file; ./$filePure"

if [[ "$ext" == "c" ]]; then
  gcc "$base"
elif [[ "$ext" == "cpp" ]]; then
  g++ "$base"
else 
  echo "Format invalid: $ext"
fi
