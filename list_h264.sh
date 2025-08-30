#!/bin/bash

find . -type f -name "*.mkv" | while read -r file; do
    # Get codec name of the first video stream
    codec=$(ffprobe -v error -select_streams v:0 \
        -show_entries stream=codec_name \                                                       
        -of default=noprint_wrappers=1:nokey=1 "$file")
  
    # If codec is not h264, print the file path
    if [[ "$codec" != "h264" ]]; then
        echo "❌ $file (video codec: $codec)" >> codecs.txt
    else
        echo "✅ $file (already H.264)" >> codecs.txt
    fi
done