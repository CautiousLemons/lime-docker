#!/bin/bash
# Start streaming the file
ls /dev/video*
if [ $? -eq 0 ]; then
    echo "Video device(s) mounted successfully!"
    stream
else
    echo "No mounted video device founded."
fi
