#!/bin/bash
# Start streaming the file
ls /dev/video*
some_command
if [ $? -eq 0 ]; then
    echo "Video device(s) mounted successfully!"
    echo "Starting to stream the video..."
    ffmpeg -re -i v1.mp4 -map 0:v -f v4l2 /dev/video0
    echo "Video stream ended."
else
    echo "No mounted video device founded"
fi