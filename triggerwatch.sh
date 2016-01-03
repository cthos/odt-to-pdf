#! /bin/bash

if [ -z "$TARGET_FOLDER" ]; then
  echo "Please Specify TARGET_FOLDER with the Run Command."
  exit 1
fi

echo "Watching $TARGET_FOLDER for changes."

fswatch -0 -r -m poll_monitor $TARGET_FOLDER | xargs -0 -n1 -I{} /home/watchy/watch.sh "{}"
