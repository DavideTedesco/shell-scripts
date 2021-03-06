#!/bin/bash

hint() {
  echo "MK4 TO MP3 CONVERT SCRIPT SYNTAX"
  echo "./mp4_to_mp3.sh /source/dir/file.mp4 /destination/dir"
}

program_exists() {
  command -v "$1" >/dev/null 2>&1
}

if [ "$1" == "-h" ]; then
  hint
  exit
fi

if ! program_exists ffmpeg; then
  echo "Looks like ffmpeg is not installed"
  exit
fi

if [ ! -f "$1" ]; then
  echo "Input file does not exist."
  exit
fi

if [ ! -d "$2" ]; then
  echo "Output directory does not exist."
  exit
fi

ffmpeg -i $1 $2"/new_audio_"$RANDOM".mp3"

echo "All done!"
