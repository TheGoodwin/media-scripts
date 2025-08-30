#!/bin/bash

#!/bin/bash

# Check if input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 inputfile.mkv"
  exit 1
fi

# Check if input file has .mkv extension
if [[ "$1" != *.mkv ]]; then
  echo "Error: Input file must be an .mkv file"
  exit 1
fi

# Extract filename without extension
filename="${1%.mkv}"

# Create output filename with custom suffix
output="${filename} H.264.mkv"

# Run ffmpeg
ffmpeg -i "$1" \
  -c:v libx264 -preset veryslow -crf 23 \
  -c:a copy \
  -c:s copy \
  "$output"
